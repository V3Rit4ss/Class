package com.lec.ex01_runnable;

public class TargetEx02 implements Runnable {

	@Override
	public void run() {
		for(int i=0; i<10; i++) {
			System.out.println("�ݰ����ϴ�."+i);
			try {
				Thread.sleep(500);
			} catch (InterruptedException e) {
				
				
			}
		}//for
		
	}//run

}
