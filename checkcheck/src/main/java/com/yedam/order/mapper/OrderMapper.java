package com.yedam.order.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.order.domain.OrderVO;

public interface OrderMapper {
	public List<OrderVO> selectOrderUserId(@Param("userId") String userId,@Param("page") int page );
	public List<OrderVO> selectOrderCancel(@Param("userId") String userId,@Param("page") int page );
	public List<OrderVO> selectOrderPresent(@Param("userId") String userId,@Param("page") int page );
	public List<OrderVO> selectOrderOrderId(String orderId);
	public int cancelUpdate(String orderId);
	public int adrUpdate(OrderVO vo);
	
	//마이페이지 유저의 주문총갯수(10개씩)
	public int getCount(String userId);
	public int getCancleCount(String userId);
	public int getPresentCount(String userId);
	public List<OrderVO> chulgoList(int page);
	public int getChulgoTotal();
	public List<String> subjectList(String orderId);
	public int updateOrderState(long orderIdList);
	
}
