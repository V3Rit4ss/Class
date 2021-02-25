package com.lec.ex03_writerReader;

import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;

public class Ex02_Writer {
	public static void main(String[] args) {
		Writer writer = null;
		try {
			writer = new FileWriter("txtFile/outTest.txt");
			String str = "照括馬室推\r\n亜蟹陥虞原郊紫焼切託朝展督馬"; //\r\n 皐亀 雌淫精蒸走幻 努什闘稽 煽舌廃依聖 災君神檎 級嬢赤奄凶庚拭 隔醸陥.
			char[] st = str.toCharArray(); //什闘元聖 char壕伸稽.
		//	writer.write(st);却陥 亜管.
			writer.write(str);
			String str1 = "焼たたたたたたたた";
			writer.write(str1);  //嬢謎球 (蓄亜)鞠辞 級嬢娃陥
		} catch (IOException e) {
			System.out.println(e.getMessage());
			
		}finally {
			try {
				if(writer!=null) writer.close();
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}
}
