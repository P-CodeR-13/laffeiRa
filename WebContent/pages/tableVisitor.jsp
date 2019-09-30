<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:forEach var="prod" items="${prodList}" varStatus="loop">
	<div class="col-sm-4">
		<div class="card" style="width: 10rem;">
			<img src="${pageContext.request.contextPath}/images/${prod.image}"
				alt="image" class="card-img-top" />
			<div class="card-body">
				<h5 id="cart-name" class="card-title">${prod.productName}</h5>
				<p id="cart-description" style="font-size: 8px;">
					${prod.description}</p>
				<p id="cart-price" class="card-text">P${prod.price}</p>
				<%-- <button onclick="getCategoryIndex('${prod.productId}');"
					class="btn btn-primary">Add to Cart</button> --%>
			</div>
		</div>
	</div>
</c:forEach>