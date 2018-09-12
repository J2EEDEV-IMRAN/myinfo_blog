<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


<div class="col-md-8">
    <div class="tbox tag-box-v3 margin-bottom-40">
        <div class="heading heading-v2 margin-bottom-40">
            <h2>Roman Numerals</h2>
        </div>
        <div class="roman">
        	<table class="table table-hover table-striped table-bordered">
	        	<thead>
	        		<tr>
	        			<th>Roman</th>
	        			<th>Numeric</th>
	        			<th>Roman</th>
	        			<th>Numeric</th>
	        			<th>Roman</th>
	        			<th>Numeric</th>
	        		</tr>
	        	</thead>
	        	<tbody>
	        		<tr>
	        			<td>none</td>
	        			<td>0</td>
	        			<td>XI</td>
	        			<td>11</td>
	        			<td>XXX</td>
	        			<td>30</td>
	        		</tr>
	        		 <tr>
	        			<td>I</td>
	        			<td>1</td>
	        			<td>XII</td>
	        			<td>12</td>
	        			<td>XL</td>
	        			<td>40</td>
	        		</tr>
	        		<tr>
	        			<td>II</td>
	        			<td>2</td>
	        			<td>XIII</td>
	        			<td>13</td>
	        			<td>L</td>
	        			<td>50</td>
	        		</tr>
	        		<tr>
	        			<td>III</td>
	        			<td>3</td>
	        			<td>XIV</td>
	        			<td>14</td>
	        			<td>LX</td>
	        			<td>60</td>
	        		</tr>
	        		<tr>
	        			<td>IV</td>
	        			<td>4</td>
	        			<td>XV</td>
	        			<td>15</td>
	        			<td>LXIX</td>
	        			<td>69</td>
	        		</tr>
	        		<tr>
	        			<td>V</td>
	        			<td>5</td>
	        			<td>XVI</td>
	        			<td>16</td>
	        			<td>LXX</td>
	        			<td>70</td>
	        		</tr>
	        		<tr>
	        			<td>VI</td>
	        			<td>6</td>
	        			<td>XVII</td>
	        			<td>17</td>
	        			<td>LXXX</td>
	        			<td>80</td>
	        		</tr>
	        		<tr>
	        			<td>VII</td>
	        			<td>7</td>
	        			<td>XVIII</td>
	        			<td>18</td>
	        			<td>XC</td>
	        			<td>90</td>
	        		</tr>
	        		<tr>
	        			<td>VIII</td>
	        			<td>8</td>
	        			<td>XIX</td>
	        			<td>19</td>
	        			<td>XCIX</td>
	        			<td>99</td>
	        		</tr>
	        		<tr>
	        			<td>IX</td>
	        			<td>9</td>
	        			<td>XX</td>
	        			<td>20</td>
	        			<td>C</td>
	        			<td>100</td>
	        		</tr>
	        		<tr>
	        			<td>X</td>
	        			<td>10</td>
	        			<td>XXV</td>
	        			<td>25</td>
	        			<td></td>
	        			<td></td>
	        		</tr>
	        	</tbody>
        </table>
        </div>
    </div>
</div>