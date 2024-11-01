package com.bug_check_background.service.impl;

import cn.dev33.satoken.secure.SaSecureUtil;
import cn.dev33.satoken.stp.StpUtil;
import com.bug_check_background.common.exception.CommonException;
import com.bug_check_background.common.result.Result;
import com.bug_check_background.mapper.UserMapper;
import com.bug_check_background.pojo.dto.LoginDto;
import com.bug_check_background.pojo.dto.RegisterDto;
import com.bug_check_background.pojo.entity.User;
import com.bug_check_background.pojo.vo.LoginVo;
import com.bug_check_background.pojo.vo.RegisterVo;
import com.bug_check_background.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;
    private static final String key = "zhian";

    @Override
    public LoginVo login(LoginDto loginDto) {
        String account = loginDto.getAccount();
        List<String> allAccount = userMapper.selectAllAccount();
        if (!allAccount.contains(account)) {
            throw new CommonException("登录失败，账号或密码错误");
        }
        String password = loginDto.getPassword();
        String twicePassword = SaSecureUtil.aesEncrypt(key, password);
        User user = userMapper.selectByAccount(account);
        if (!user.getPassword().equals(twicePassword)) {
            throw new CommonException("登录失败，账号或密码错误");
        }
        StpUtil.login(user.getId());
        String token = StpUtil.getTokenValue();
        LoginVo loginVo = LoginVo.builder().id(user.getId()).account(account).token(token).username(user.getUsername()).build();
        return loginVo;
    }

    @Override
    public RegisterVo register(RegisterDto loginDto) {
        String username = loginDto.getUsername();
        String account = loginDto.getAccount();
        List<String> allAccount = userMapper.selectAllAccount();
        if (allAccount.contains(account)) {
            throw new CommonException("账号已存在，请重新输入");
        }
        String encryptedText = loginDto.getPassword(); // 这里填入前端加密后的文本
        String secretKey = "!QA2Z@w1sxO*(-8L";
        String iv = "!WFNZFU_{H%M(S|a";
        String realPassword = loginDto.getPassword();
//        String realPassword = null;
//        try {
//            realPassword = decrypt(encryptedText, secretKey, iv);
//        } catch (Exception e) {
//            throw new CommonException("密码解密失败");
//        }
        if (!isValidPassword(realPassword)) {
            throw new CommonException("密码不符合要求");
        }
        String twicePassword = SaSecureUtil.aesEncrypt(key, realPassword);
        User user = User.builder().username(username).account(account).password(twicePassword).email(loginDto.getEmail()).build();
        userMapper.insert(user);
        return null;
    }

    /**
     * aes解密
     *
     * @param encryptedText
     * @param secretKey
     * @param iv
     * @return
     * @throws Exception
     */

    public String decrypt(String encryptedText, String secretKey, String iv) throws Exception {
        // 密钥和初始化向量转换为字节数组
        byte[] keyBytes = secretKey.getBytes(StandardCharsets.UTF_8);
        byte[] ivBytes = iv.getBytes(StandardCharsets.UTF_8);

        // 创建密钥和初始化向量规格
        SecretKeySpec secretKeySpec = new SecretKeySpec(keyBytes, "AES");
        IvParameterSpec ivParameterSpec = new IvParameterSpec(ivBytes);

        // 创建Cipher实例并初始化解密器，确保使用PKCS5Padding（或PKCS7Padding，如果Java版本支持）
        // 注意：Java标准库默认没有PKCS7Padding，但PKCS5Padding在8字节块时与PKCS7相同
        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
        cipher.init(Cipher.DECRYPT_MODE, secretKeySpec, ivParameterSpec);

        // 将Base64编码的密文转换为字节数组
        byte[] encodedValue = Base64.getDecoder().decode(encryptedText);

        // 解密数据
        byte[] decryptedValue = cipher.doFinal(encodedValue);

        // 将解密后的字节数组转换为字符串
        return new String(decryptedValue, StandardCharsets.UTF_8);
    }

    /**
     * aes加密
     *
     * @param plainText
     * @param secretKey
     * @param iv
     * @return
     * @throws Exception
     */
    public String encrypt(String plainText, String secretKey, String iv) throws Exception {
        // 密钥和初始化向量转换为字节数组
        byte[] keyBytes = secretKey.getBytes(StandardCharsets.UTF_8);
        byte[] ivBytes = iv.getBytes(StandardCharsets.UTF_8);

        // 创建密钥和初始化向量规格
        SecretKeySpec secretKeySpec = new SecretKeySpec(keyBytes, "AES");
        IvParameterSpec ivParameterSpec = new IvParameterSpec(ivBytes);

        // 创建Cipher实例并初始化加密器
        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
        cipher.init(Cipher.ENCRYPT_MODE, secretKeySpec, ivParameterSpec);

        // 加密数据
        byte[] encryptedValue = cipher.doFinal(plainText.getBytes(StandardCharsets.UTF_8));

        // 将加密后的字节数组转换为Base64编码的字符串
        return Base64.getEncoder().encodeToString(encryptedValue);
    }

    /**
     * 正则表达式校验密码
     *
     * @param password
     * @return
     */
    private static boolean isValidPassword(String password) {
        // 定义正则表达式
        String regex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!\"#$%&'()*+,-./:;<=>?@\\[\\]^`{|}~\\\\])[\\da-zA-Z!\"#$%&'()*+,-./:;<=>?@\\[\\]^`{|}~\\\\]{8,32}$";
        // 编译正则表达式
        Pattern pattern = Pattern.compile(regex);
        // 创建匹配器
        Matcher matcher = pattern.matcher(password);
        // 进行匹配
        return matcher.matches();
    }
}
