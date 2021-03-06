<%@page import="ajax.model.entity.Goods"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<li class="list  J_item_wrap aj-grid-list" data-id='<c:out value="${item.getId() }"></c:out>'>
	<div class='aj-header'>
		<div class='aj-logo' style="display:none;">
			<img src='logo.png' />
		</div>
		<div class="aj-stamps aj-stamps-x">
			<div class="aj-s-wrap">
				<div class="aj-stamp aj-jian" rank="1" title="小编推荐">
					荐
					<span class="aj-info">小编推荐</span>
				</div>
				<div class="aj-stamp aj-hot qmm-icon-fire" rank="1" title="当前很火">
					火
					<span class="aj-info">当前很火</span>
				</div>
				<div class="aj-stamp aj-new" rank="1" title="新品上架">
					新
					<span class="aj-info">新品上架</span>
				</div>									
			</div>
		</div>	
	</div>
    <a class="picBox titleLink" target="_blank" title=""
    href="${item.getGoodsLink() }">
        <img title="" style="margin-top: 0px; max-width:100%;"
        alt="" src='<c:out value="${item.getHomeImg() }"></c:out>'>
    </a>
    <div class="listItem">
        <h2 class="itemName">
            <a target="_blank" href="http://www.quanmama.com:8080/zhidemai/287196.html">
                <span class="black" title="">
                    <c:out value="${item.getName() }"></c:out>
                </span>
            </a>
        </h2>
        <div class="item_buy_mall">
            <div class="zan_fav_com">
               	 价格: <c:out value="${item.getPrice() }"></c:out> 元
            </div>
            <a style='float:right;' class="directLink" target="_blank" href='<c:out value="${item.getGoodsLink() }"></c:out>'>
                查看详情
            </a>
			<div style='clear:both;'></div>
        </div>
    </div>
</li>