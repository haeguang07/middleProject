package com.yedam.common;

import java.io.IOException;


import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.nodes.Node;
import org.jsoup.select.Elements;

public class test {
	public static void main(String[] args) throws IOException {
		String URL = "https://www.aladin.co.kr/shop/wproduct.aspx?ItemId=235079549&amp;copyPaper=1&amp;ttbkey=ttbhbj040030858001&amp;start=api";
		Document doc = Jsoup.connect(URL).get();
		
		Node imageUrlElements = doc.getElementById("div_TOC_Short").childNode(0);

		    System.out.println(imageUrlElements);
//		String text = doc.text();
		
//		int number = text.indexOf("책소개");
//		System.out.println(number);
//		System.out.println(text);
		
		
	}
}
