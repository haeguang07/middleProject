package com.yedam.coupon.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.coupon.domain.CouponVO;

public interface CouponMapper {
	public List<CouponVO> searchCoupon(@Param("userId")String userId,@Param("page")int page);
	public int getCount(String userId);
	public List<CouponVO> YsearchCoupon(String userId);
}
