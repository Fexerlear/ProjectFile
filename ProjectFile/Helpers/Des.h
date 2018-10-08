//
//  Des.h
//  DES
//
//  Created by Monking on 15/9/8.
//  Copyright (c) 2015年 DES. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Des : NSObject
+(NSString *) encryptUseDES:(NSString *)plainText;
+(NSString *) parseByte2HexString:(Byte *) bytes;
+(NSString *) parseByteArray2HexString:(Byte[]) bytes;
//+(NSString*) decryptUseDES:(NSString*)cipherText;
+ (NSString*) decryptUseDESData:(NSData*)cipherD;
+ (NSData*) decryptUseDES:(NSData*)cipherD;
@end
