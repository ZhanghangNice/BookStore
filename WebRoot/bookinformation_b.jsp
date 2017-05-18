<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div>
	<table class="table table-bordered">
		<tbody>
			<tr>
				<th>书名</th>
				<td>${ book.bookname }</td>
			</tr>
			<tr>
				<th>作者</th>
				<td>${ book.author }</td>
			</tr>
			<tr>
				<th>ISBN</th>
				<td>${ book.bookid }</td>
			</tr>
			<tr>
				<th>包装</th>
				<td>${ bookdetail.packaging }</td>
			</tr>
			<tr>
				<th>版次</th>
				<td>${ bookdetail.edition }</td>
			</tr>
			<tr>
				<th>出版社</th>
				<td>${ book.publisher }</td>
			</tr>
			<tr>
				<th>开本</th>
				<td>${ bookdetail.format }</td>
			</tr>
			<tr>
				<th>出版时间</th>
				<td>${ bookdetail.publdata }</td>
			</tr>
			<tr>
				<th>页数</th>
				<td>${ bookdetail.numpages }</td>
			</tr>
			<tr>
				<th>正文种语</th>
				<td>${ bookdetail.language }</td>
			</tr>
			<tr>
				<th>服务</th>
				<td>熊猫书城负责发货并为您提供售后服务保障</td>
			</tr>
		</tbody>
	</table>
</div>