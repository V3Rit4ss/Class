package com.lec.ex06_toy;

public class AirplaneToy implements IMissile, ILight {
	public AirplaneToy() {
		System.out.println("비행기 장난감 입니다.");
		canLight();
		canMissile();
	}
	@Override
	public void canLight() {
		System.out.println("불빛 발사 가능합니다.");
	}

	@Override
	public void canMissile() {
		System.out.println("미사일 쏠 수 있습니다.");
	}
	@Override
	public String toString() {//super.toString() 오브젝트에 있는걸 실행 시키니 뺀다.
		return "불빛과 미사일 쏘는 비행기.";
	}
	
}
