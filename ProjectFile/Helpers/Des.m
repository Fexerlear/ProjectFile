//
//  Des.m
//  DES
//
//  Created by Monking on 15/9/8.
//  Copyright (c) 2015年 DES. All rights reserved.
//

#import "Des.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>
#import "Base64.h"



#define DES_KEYVALUE @"^pEn9Aj/"

@implementation Des
static Byte iv[] = {1,2,3,4,5,6,7,8};

#if 0
static int size = 20480;//如发现有切割进行扩大
+ (NSString *) encryptUseDES:(NSString *)plainText
{
    NSString *ciphertext = nil;
    const char *textBytes = [plainText UTF8String];
//    NSUInteger dataLength = [plainText length];
    NSUInteger dataLength = [Des calc_charsetNum:plainText];

    unsigned char buffer[size];
    memset(buffer, 0, sizeof(char));
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding,
                                          [DES_KEYVALUE UTF8String], kCCKeySizeDES,
                                          iv,
                                          textBytes,
                                          dataLength,
                                          buffer, size,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        NSData *data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesEncrypted];
        ciphertext =[Base64 stringByEncodingData:data];
    }
    return ciphertext;
}

+ (NSInteger)calc_charsetNum:(NSString*)_str
{
    NSInteger result = 0;
    const char *tchar=[_str UTF8String];
    if (NULL == tchar) {
        return result;
    }
    result = strlen(tchar);
    return result;
}

//+ (NSString*) decryptUseDES:(NSString*)cipherText {
//    NSData* cipherData = [Base64 decodeString:cipherText];
//    unsigned char buffer[size];
//    memset(buffer, 0, sizeof(char));
//    size_t numBytesDecrypted = 0;
//    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
//                                          kCCAlgorithmDES,
//                                          kCCOptionPKCS7Padding,
//                                          [DES_KEYVALUE UTF8String],
//                                          kCCKeySizeDES,
//                                          iv,
//                                          [cipherData bytes],
//                                          [cipherData length],
//                                          buffer,
//                                          size,
//                                          &numBytesDecrypted);
//    NSString* plainText = nil;
//    if (cryptStatus == kCCSuccess) {
//        NSData* data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesDecrypted];
//        plainText = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//    }
//    return plainText;
//}

+ (NSData*) decryptUseDES:(NSData*)cipherD {
    NSData* cipherData = [Base64 decodeData:cipherD];
    unsigned char buffer[size];
    memset(buffer, 0, sizeof(char));
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding,
                                          [DES_KEYVALUE UTF8String],
                                          kCCKeySizeDES,
                                          iv,
                                          [cipherData bytes],
                                          [cipherData length],
                                          buffer,
                                          size,
                                          &numBytesDecrypted);
    if (cryptStatus == kCCSuccess) {
        NSData* data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesDecrypted];
        return data;
    }
    //不成功就返回原来的数据
    return cipherD;
}



+ (NSString*) decryptUseDESData:(NSData*)cipherD {
    NSData* cipherData = [Base64 decodeData:cipherD];
    unsigned char buffer[size];
    memset(buffer, 0, sizeof(char));
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding,
                                          [DES_KEYVALUE UTF8String],
                                          kCCKeySizeDES,
                                          iv,
                                          [cipherData bytes],
                                          [cipherData length],
                                          buffer,
                                          size,
                                          &numBytesDecrypted);
    NSString* plainText = nil;
    NSData* data;
    if (cryptStatus == kCCSuccess) {
         data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesDecrypted];
        plainText = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return plainText;
}


+(NSString *) parseByte2HexString:(Byte *) bytes
{
    NSMutableString *hexStr = [[NSMutableString alloc]init];
    int i = 0;
    if(bytes)
    {
        while (bytes[i] != '\0')
        {
            NSString *hexByte = [NSString stringWithFormat:@"%x",bytes[i] & 0xff];///16进制数
            if([hexByte length]==1)
                [hexStr appendFormat:@"0%@", hexByte];
            else
                [hexStr appendFormat:@"%@", hexByte];
            i++;
        }
    }
    YLog(@"bytes 的16进制数为:%@",hexStr);
    return hexStr;
}


+(NSString *) parseByteArray2HexString:(Byte[]) bytes
{
    NSMutableString *hexStr = [[NSMutableString alloc]init];
    int i = 0;
    if(bytes)
    {
        while (bytes[i] != '\0')
        {
            NSString *hexByte = [NSString stringWithFormat:@"%x",bytes[i] & 0xff];///16进制数
            if([hexByte length]==1)
                [hexStr appendFormat:@"0%@", hexByte];
            else
                [hexStr appendFormat:@"%@", hexByte];
            i++;
        }
        
    }
    YLog(@"bytes 的16进制数为:%@",hexStr);
    return hexStr;
}
#else //不可以将加密后数据内存区域的大小设置为固定值  Add by xys 2015-11-26

//dataOutAvailable = (dataInLength + kCCBlockSizeDES) & ~(kCCBlockSizeDES - 1);
+ (NSString *) encryptUseDES:(NSString *)plainText
{
    NSString *ciphertext = nil;
    const char *textBytes = [plainText UTF8String];
    //    NSUInteger dataLength = [plainText length];
    NSUInteger dataLength = [Des calc_charsetNum:plainText];
    
    size_t bufferSize = 0;
    unsigned char * buffer = NULL;
    
    bufferSize = (dataLength + kCCBlockSizeDES) & ~(kCCBlockSizeDES - 1);
    buffer = malloc(bufferSize);
    memset(buffer, 0, bufferSize);
    
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding,
                                          [DES_KEYVALUE UTF8String], kCCKeySizeDES,
                                          iv,
                                          textBytes,
                                          dataLength,
                                          buffer, bufferSize,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        NSData *data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesEncrypted];
        ciphertext =[Base64 stringByEncodingData:data];
    }
    
    free(buffer);
    
    return ciphertext;
}

+ (NSInteger)calc_charsetNum:(NSString*)_str
{
    NSInteger result = 0;
    const char *tchar=[_str UTF8String];
    if (NULL == tchar) {
        return result;
    }
    result = strlen(tchar);
    return result;
}

+ (NSData*) decryptUseDES:(NSData*)cipherD {
    NSData* cipherData = [Base64 decodeData:cipherD];
    
    size_t bufferSize = 0;
    unsigned char * buffer = NULL;
    
    bufferSize = ([cipherData length] + kCCBlockSizeDES) & ~(kCCBlockSizeDES - 1);
    buffer = malloc(bufferSize);
    memset(buffer, 0, bufferSize);
    
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding,
                                          [DES_KEYVALUE UTF8String],
                                          kCCKeySizeDES,
                                          iv,
                                          [cipherData bytes],
                                          [cipherData length],
                                          buffer,
                                          bufferSize,
                                          &numBytesDecrypted);
    if (cryptStatus == kCCSuccess) {
        NSData* data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesDecrypted];
        free(buffer);
        return data;
    }
    
    free(buffer);
    //不成功就返回原来的数据
    return cipherD;
}



+ (NSString*) decryptUseDESData:(NSData*)cipherD {
    NSData* cipherData = [Base64 decodeData:cipherD];
    size_t bufferSize = 0;
    unsigned char * buffer = NULL;
    
    bufferSize = ([cipherData length] + kCCBlockSizeDES) & ~(kCCBlockSizeDES - 1);
    buffer = malloc(bufferSize);
    memset(buffer, 0, bufferSize);
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding,
                                          [DES_KEYVALUE UTF8String],
                                          kCCKeySizeDES,
                                          iv,
                                          [cipherData bytes],
                                          [cipherData length],
                                          buffer,
                                          bufferSize,
                                          &numBytesDecrypted);
    NSString* plainText = nil;
    NSData* data;
    if (cryptStatus == kCCSuccess) {
        data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesDecrypted];
        plainText = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    free(buffer);
    
    return plainText;
}


+(NSString *) parseByte2HexString:(Byte *) bytes
{
    NSMutableString *hexStr = [[NSMutableString alloc]init];
    int i = 0;
    if(bytes)
    {
        while (bytes[i] != '\0')
        {
            NSString *hexByte = [NSString stringWithFormat:@"%x",bytes[i] & 0xff];///16进制数
            if([hexByte length]==1)
                [hexStr appendFormat:@"0%@", hexByte];
            else
                [hexStr appendFormat:@"%@", hexByte];
            i++;
        }
    }
    return hexStr;
}


+(NSString *) parseByteArray2HexString:(Byte[]) bytes
{
    NSMutableString *hexStr = [[NSMutableString alloc]init];
    int i = 0;
    if(bytes)
    {
        while (bytes[i] != '\0')
        {
            NSString *hexByte = [NSString stringWithFormat:@"%x",bytes[i] & 0xff];///16进制数
            if([hexByte length]==1)
                [hexStr appendFormat:@"0%@", hexByte];
            else
                [hexStr appendFormat:@"%@", hexByte];
            i++;
        }
        
    }

    return hexStr;
}

#endif
@end
