package com.yedam.coupon.service;

import java.util.List;

import com.yedam.coupon.domain.CouponVO;

public interface CouponService {
	public List<CouponVO> couponList(String userId);
	public int getCount(String userId);
}
