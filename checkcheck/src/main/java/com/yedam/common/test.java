package com.yedam.common;

import java.io.IOException;
import java.util.Arrays;
import java.util.Date;


public class test {
	public static void main(String[] args) throws IOException {

//		String URL = "https://www.aladin.co.kr/shop/wproduct.aspx?ItemId=235079549&amp;copyPaper=1&amp;ttbkey=ttbhbj040030858001&amp;start=api";
//		Document doc = Jsoup.connect(URL).get();
//		
//		
//		String text = doc.html();
//		System.out.println(text);
		String[] str= {"1","2","3","4"};
		System.out.println((Arrays.toString(str)).replaceAll("\\[","").replaceAll("\\]",""));
		
		

		Date date = new Date();
		System.out.println(date.getTime());
	}
}
