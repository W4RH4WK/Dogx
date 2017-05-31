<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:outline="http://wkhtmltopdf.org/outline"
                xmlns="http://www.w3.org/1999/xhtml">
	<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	            doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
	            indent="yes" />
	<xsl:template match="outline:outline">
		<html>
			<head>
				<title>Table of Contents</title>
				<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
				<style>
					body {
						font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
						font-size: 14px;
						line-height: 1.43;
					}

					h1 {
						font-size: 28px;
						text-align: center;
						margin-bottom: 1.5em;
					}

					ul {
						margin: 0em 0em 0em 1em;
						padding: 0em;
					}

					li {
						list-style: none;
						line-height: 1.7;
					}

					.level-0 li {
						margin-bottom: 1em;
					}

					.level-x li {
						margin-bottom: 0em;
					}

					.page-number {
						float: right;
					}
				</style>
			</head>
			<body>
				<h1>Table of Contents</h1>
				<ul class="level-0"><xsl:apply-templates select="outline:item/outline:item" /></ul>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="outline:item">
		<xsl:if test="@title!='' and @title!='Table of Contents'">
			<li>
					<a>
						<xsl:if test="@link">
							<xsl:attribute name="href"><xsl:value-of select="@link" /></xsl:attribute>
						</xsl:if>
						<xsl:if test="@backLink">
							<xsl:attribute name="name"><xsl:value-of select="@backLink" /></xsl:attribute>
						</xsl:if>
						<xsl:value-of select="@title" />
					</a>
					<span class="page-number"><xsl:value-of select="@page" /></span>
				<ul class="level-x">
					<xsl:comment>added to prevent self-closing tags in QtXmlPatterns</xsl:comment>
					<xsl:apply-templates select="outline:item" />
				</ul>
			</li>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
