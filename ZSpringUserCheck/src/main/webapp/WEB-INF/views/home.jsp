<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script>
		function usercheck(){
			var id = $('#id').val();
			$.ajax({
				url: 'user_check.me',
				type: 'post',
				data: {'id':id},
				dataType : 'json',
				contentType : 'application/x-www-form-urlencoded; charset=utf-8',
				success: function(res){
					if(res==1){
						alert('사용할 수 없는 아이디');
					}else{
						alert('사용할 수 있는 아이디');
					}
					
				},
				error: function(){
					alert('ajax 통신 실패(usercheck)');
				}
			});
		}
	</script>
</head>
<body>
	<div class="user_form">
		<ul>
			<li>
				<label for="id">아이디</label>
				<input type="text" id="id" name="id">
				<button type="button" onclick="usercheck()">중복 체크</button>
			</li>
		</ul>
	</div>
</body>
</html>