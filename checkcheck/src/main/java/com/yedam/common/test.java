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
		
		
		String text = doc.html();
		System.out.println(text);
		
		
	}
}
