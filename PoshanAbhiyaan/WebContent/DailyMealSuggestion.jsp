<%@page import="java.util.TimeZone"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.time.temporal.WeekFields"%>
<%@page import="dailyMeal.Meal"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		Meal[] weeklyMeals = new Meal[8];
		// 1 - Sunday
		weeklyMeals[1] = new Meal("Low-Gi muesli,Natural yoghurt,Few slices of your favourite fruit",
				"Soya and potato (aloo) curry,\n Ladies Finger,\n Curd,\n Chapati/ Rice",
				"Lemonade, Mixed nuts and raisins", "Mung bean dal, Mixed Veg Curry, Chapati/ Rice");

		weeklyMeals[2] = new Meal("Sprouts paratha , Buttermilk", "Spinach and Corn Curry, Chapati/ Rice", "Banana",
				"Peas and mint soup, Pasta with tomato sauce");
		weeklyMeals[3] = new Meal("Saut�ed mushrooms, Wholewheat toast, Banana milkshake",
				"Mixed dal, Carrot and peas sabzi, Curd (dahi), Pearl millet (bajra) roti", "Roasted Peanuts",
				"Cumin and potato curry, Chapati/ Rice");

		weeklyMeals[4] = new Meal("Tomato and cucumber sandwich with mint chutney, Pineapple juice",
				"Black gram dal, Brinjal bharta, Curd, Chapati/rice", "Coconut water, Roasted chickpeas",
				"Paalak Paneer, Jowar Roti");

		weeklyMeals[5] = new Meal("Low-Gi muesli,Natural yoghurt,Few slices of your favourite fruit",
				"Soya and potato (aloo) curry,\n Ladies Finger,\n Curd,\n Chapati/ Rice",
				"Lemonade, Mixed nuts and raisins", "Mung bean dal, Mixed Veg Curry, Chapati/ Rice");

		weeklyMeals[6] = new Meal("Sprouts paratha , Buttermilk", "Spinach and Corn Curry, Chapati/ Rice", "Banana",
				"Peas and mint soup, Pasta with tomato sauce");

		weeklyMeals[7] = new Meal("Saut�ed mushrooms, Wholewheat toast, Banana milkshake",
				"Mixed dal, Carrot and peas sabzi, Curd (dahi), Pearl millet (bajra) roti", "Roasted Peanuts",
				"Cumin and potato curry, Chapati/ Rice");

		Calendar calendar = Calendar.getInstance(TimeZone.getDefault());
		int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);
		Meal todaysMeal = weeklyMeals[dayOfWeek];
	%>
	<table border=1 align="center">
		<col width="180">
		<col width="500">
		<caption align=top>
			<h3>Today's Meal</h3>
		</caption>
		<tr>
			<td>BreakFast</td>
			<td>
				<%
					String[] food = todaysMeal.getBreakfast().split(",");
					for (int i = 0; i < food.length; i++) {
						out.println(food[i]);
				%> <br> <%
 	}
 %>
			</td>
		</tr>
		<tr>
			<td>Lunch</td>
			<td>
				<%
					food = todaysMeal.getLunch().split(",");
					for (int i = 0; i < food.length; i++) {
						out.println(food[i]);
				%> <br> <%
 	}
 %>
			</td>
		</tr>
		<tr>
			<td>Snack</td>
			<td>
				<%
					food = todaysMeal.getSnack_option().split(",");
					for (int i = 0; i < food.length; i++) {
						out.println(food[i]);
				%> <br> <%
 	}
 %>
			</td>
		</tr>
		<tr>
			<td>Dinner</td>
			<td>
				<%
					food = todaysMeal.getDinner().split(",");
					for (int i = 0; i < food.length; i++) {
						out.println(food[i]);
				%> <br> <%
 	}
 %>
			</td>
		</tr>

	</table>
</body>
</html>