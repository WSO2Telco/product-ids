/*******************************************************************************
 * Copyright  (c) 2015-2016, WSO2.Telco Inc. (http://www.wso2telco.com) All Rights Reserved.
 * 
 * WSO2.Telco Inc. licences this file to you under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *   http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 ******************************************************************************/
package com.wso2telco.util;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import com.google.gdata.util.common.util.Base64;

 
// TODO: Auto-generated Javadoc
 
/**
 * The Class EncryptAES.
 */
public class EncryptAES {

	 
	/** The cipher. */
	private static Cipher cipher;

	 
	/** The key value. */
	private static byte[] keyValue;

	static {
		keyValue = FileUtil.getApplicationProperty("key").getBytes();
	}

	 
	/**
	 * Encrypt.
	 *
	 * @param plainText the plain text
	 * @return the string
	 * @throws Exception the exception
	 */
	public static String encrypt(String plainText) throws Exception {

		SecretKey key = new SecretKeySpec(keyValue, "AES");
		String encryptedText = "";
		cipher = Cipher.getInstance("AES");

		if (plainText != null) {
			byte[] plainTextByte = plainText.getBytes();
			cipher.init(Cipher.ENCRYPT_MODE, key);
			byte[] encryptedByte = cipher.doFinal(plainTextByte);
			encryptedText = Base64.encode(encryptedByte);
		} else {
			// nop
		}

		return encryptedText;
	}

}
