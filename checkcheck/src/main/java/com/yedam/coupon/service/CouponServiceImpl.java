package com.yedam.coupon.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.coupon.domain.CouponVO;
import com.yedam.coupon.mapper.CouponMapper;

public class CouponServiceImpl implements CouponService {
	SqlSession session = DataSource.getInstance().openSession(true);
	CouponMapper mapper = session.getMapper(CouponMapper.class);
	@Override
	public List<CouponVO> couponList(String userId) {
		// TODO Auto-generated method stub
		return mapper.searchCoupon(userId);
	}
	@Override
	public int getCount(String userId) {		
		return mapper.getCount(userId);
	}
	@Override
	public List<CouponVO> ycouponList(String userId) {
		return mapper.YsearchCoupon(userId);
	}
	
	
	

}
