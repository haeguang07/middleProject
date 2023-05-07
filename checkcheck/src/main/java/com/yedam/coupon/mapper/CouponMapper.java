package com.yedam.coupon.mapper;

import java.util.List;

import com.yedam.coupon.domain.CouponVO;

public interface CouponMapper {
	public List<CouponVO> searchCoupon(String userId);
}
