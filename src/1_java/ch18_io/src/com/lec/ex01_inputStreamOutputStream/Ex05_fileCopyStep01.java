package com.lec.ex01_inputStreamOutputStream;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

//파일 카피    : 1.스트링 객체 생성 (2개 필요 inputStream , outputStream) 2.읽고 쓰기(반복 ) 3.스트링 닫기
public class Ex05_fileCopyStep01 { //굳이 프로젝트 안에 파일을 받을 필요는 없다.
	public static void main(String[] args) {
		FileInputStream is = null;    //InputStream 파일스트림이던 이거던 상관없다.
		OutputStream os = null;
		try {  //  / : 하나만 쓰던 \\ 두개를 쓰던
			is = new FileInputStream("txtFile\\495773655269005.jpg"); //input 객체 (입력)
			os = new FileOutputStream("txtFile/jigu.jpg");  // output 객체 (출력)
			int cnt =0;
			while(true) {
				++cnt;
		//		System.out.println(cnt); 뿌려서 보려면 엄청 걸림.
				int i = is.read(); //1바이트 읽기
				if(i == -1) break;
				os.write(i);
			}
			System.out.println(cnt+"번 반복문 실행 후 파일 복사 성공");
		}catch(FileNotFoundException e) {
			System.out.println("파일이나 폴더를 못 찾음"+e.getMessage());
		} catch (IOException e) {
			System.out.println("읽고 쓸때 예외남"+e.getMessage());
		}finally {
			
			try {
				if(is != null) is.close();
				if(os != null) os.close();  //스트림을 만든 반대방향으로 클로즈 해줘야함.
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
			
		}
	}
}
