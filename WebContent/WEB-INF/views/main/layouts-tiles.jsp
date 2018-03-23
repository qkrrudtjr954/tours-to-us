<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<html>
	<tiles:insertAttribute name="header"/>
	<title>${doc_title }</title>
</head>
<body>

<header>
	<tiles:insertAttribute name="top_menu"/>
</header>

<div>
	<tiles:insertAttribute name="main"/>
</div>

</body>
</html>
