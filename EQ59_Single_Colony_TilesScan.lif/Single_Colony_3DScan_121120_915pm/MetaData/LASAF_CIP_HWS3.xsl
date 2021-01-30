<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	<xsl:param name="tempVal" select="none"/>
	<xsl:template match="/">
		<HTML>
			<HEAD>
				<TITLE>
					<xsl:value-of select="@Name"/>
				</TITLE>
				<script type="text/javascript">
					  var visible = 0;
					  var FilterSettingsDetailsVisible = 0;
					  var ScannerSettingsDetailsVisible = 0;
					  
					  var LocalizeGSDEventsDetailsVisible = 0;
					  var GISTDrawHighresImageDetailsVisible = 0;
					  var GSDMergeEventListVisible = 0;
					  var FilterGSDEventListVisible = 0;
					  var DriftCompensationVisible = 0;
					  
					  function Show()
					  {
						  if(visible == 0)
						  {
							  window.document.getElementById("ID_1").style.display = "none";
							  window.document.getElementById("ID_2").style.display = "block";
							  visible = 1;
						  }
						  else
						  {
							  window.document.getElementById("ID_1").style.display = "block";
							  window.document.getElementById("ID_2").style.display = "none";
							  visible = 0;
						  }
					  }
					  function ShowFilterSettingsDetails()
					  {
						  if(FilterSettingsDetailsVisible == 0)
						  {
							  window.document.getElementById("ID_3").style.display = "none";
							  window.document.getElementById("ID_4").style.display = "block";
							  FilterSettingsDetailsVisible = 1;
						  }
						  else
						  {
							  window.document.getElementById("ID_3").style.display = "block";
							  window.document.getElementById("ID_4").style.display = "none";
							  FilterSettingsDetailsVisible = 0;
						  }
					  }
					  function ShowScannerSettingsDetails()
					  {
						  if(ScannerSettingsDetailsVisible == 0)
						  {
							  window.document.getElementById("ID_5").style.display = "none";
							  window.document.getElementById("ID_6").style.display = "block";
							  ScannerSettingsDetailsVisible = 1;
						  }
						  else
						  {
							  window.document.getElementById("ID_5").style.display = "block";
							  window.document.getElementById("ID_6").style.display = "none";
							  ScannerSettingsDetailsVisible = 0;
						  }
					  }
					  function ShowLocalizeGSDEventsDetails()
					  {
						  if(LocalizeGSDEventsDetailsVisible == 0)
						  {
							  var a = window.document.getElementsByName("ID_2001");
							  for(var i = 0; i != a.length; i++)
							  {
								  a[i].style.display = "none";
							  }
					  
							  var b = window.document.getElementsByName("ID_2002");
							  for(var j = 0; j != b.length; j++)
							  {
								  b[j].style.display = "block";
							  }							  
							  
							  LocalizeGSDEventsDetailsVisible = 1;
						  }
						  else
						  {
							  var a = window.document.getElementsByName("ID_2001");
							  for(var i = 0; i != a.length; i++)
							  {
								  a[i].style.display = "block";
							  }
							  
							  var b = window.document.getElementsByName("ID_2002");
							  for(var j = 0; j != b.length; j++)
							  {
								  b[j].style.display = "none";
							  }							  
							  
							  LocalizeGSDEventsDetailsVisible = 0;
						  }
					  }
					  
					  function ShowGISTDrawHighresImageDetails()
					  {
					   if(GISTDrawHighresImageDetailsVisible == 0)
						  {
							  var a = window.document.getElementsByName("ID_2003");
							  for(var i = 0; i != a.length; i++)
							  {
								  a[i].style.display = "none";
							  }
							  
							  var b = window.document.getElementsByName("ID_2004");
							  for(var j = 0; j != b.length; j++)
							  {
								  b[j].style.display = "block";
							  }							  
							  
							  GISTDrawHighresImageDetailsVisible = 1;
						  }
						  else
						  {
							  var a = window.document.getElementsByName("ID_2003");
							  for(var i = 0; i != a.length; i++)
							  {
								  a[i].style.display = "block";
							  }
							  
							  var b = window.document.getElementsByName("ID_2004");
							  for(var j = 0; j != b.length; j++)
							  {
								  b[j].style.display = "none";
							  }							  
							  
							  GISTDrawHighresImageDetailsVisible = 0;
						  }
					  }
					  
					  function ShowGSDMergeEventListDetails()
					  {
					   if(GSDMergeEventListVisible == 0)
						  {
							  var a = window.document.getElementsByName("ID_2005");
							  for(var i = 0; i != a.length; i++)
							  {
								  a[i].style.display = "none";
							  }
							  
							  var b = window.document.getElementsByName("ID_2006");
							  for(var j = 0; j != b.length; j++)
							  {
								  b[j].style.display = "block";
							  }							  
							  
							  GSDMergeEventListVisible = 1;
						  }
						  else
						  {
							  var a = window.document.getElementsByName("ID_2005");
							  for(var i = 0; i != a.length; i++)
							  {
								  a[i].style.display = "block";
							  }
							  
							  var b = window.document.getElementsByName("ID_2006");
							  for(var j = 0; j != b.length; j++)
							  {
								  b[j].style.display = "none";
							  }							  
							  
							  GSDMergeEventListVisible = 0;
						  }
					  }
					  
					  function ShowFilterGSDEventListDetails()
					  {
					  	  if(FilterGSDEventListVisible == 0)
						  {
							  var a = window.document.getElementsByName("ID_2007");
							  for(var i = 0; i != a.length; i++)
							  {
								  a[i].style.display = "none";
							  }
							  
							  var b = window.document.getElementsByName("ID_2008");
							  for(var j = 0; j != b.length; j++)
							  {
								  b[j].style.display = "block";
							  }							  
							  
							  FilterGSDEventListVisible = 1;
						  }
						  else
						  {
							  var a = window.document.getElementsByName("ID_2007");
							  for(var i = 0; i != a.length; i++)
							  {
								  a[i].style.display = "block";
							  }
							  
							  var b = window.document.getElementsByName("ID_2008");
							  for(var j = 0; j != b.length; j++)
							  {
								  b[j].style.display = "none";
							  }							  
							  
							  FilterGSDEventListVisible = 0;
						  }
					  }
					  
					  function ShowDriftCompensationDetails()
					  {
					  	  if(DriftCompensationVisible == 0)
						  {
							  var a = window.document.getElementsByName("ID_2009");
							  for(var i = 0; i != a.length; i++)
							  {
								  a[i].style.display = "none";
							  }
							  
							  var b = window.document.getElementsByName("ID_2010");
							  for(var j = 0; j != b.length; j++)
							  {
								  b[j].style.display = "block";
							  }							  
							  
							  DriftCompensationVisible = 1;
						  }
						  else
						  {
							  var a = window.document.getElementsByName("ID_2009");
							  for(var i = 0; i != a.length; i++)
							  {
								  a[i].style.display = "block";
							  }
							  
							  var b = window.document.getElementsByName("ID_2010");
							  for(var j = 0; j != b.length; j++)
							  {
								  b[j].style.display = "none";
							  }							  
							  
							  DriftCompensationVisible = 0;
						  }
					  }
        </script>
			</HEAD>
			<BODY topmargin="0px" leftmargin="0px" bgcolor="#EEEEEE">
				<xsl:apply-templates select="Data"/>
			</BODY>
		</HTML>
	</xsl:template>
	<xsl:template match="Data">
		<xsl:apply-templates select="Image/ImageDescription"/>
		<xsl:apply-templates select="Image/Attachment/FRAPplus"/>
		<xsl:apply-templates select="Image/TimeStampList"/>
		<xsl:apply-templates select="Image/Attachment"/>
		<xsl:apply-templates select="Image/Attachment/LDM_Block_Sequential/LDM_Block_Sequential_List"/>
	</xsl:template>
	<xsl:template name="break">
		<xsl:param name="text" select="//User-Comment"/>
		<xsl:comment>This inserts line breaks into the user description in place of line feeds</xsl:comment>
		<xsl:choose>
			<xsl:when test="contains($text, '&#xa;')">
				<xsl:value-of select="substring-before($text, '&#xa;')"/>
				<br/>
				<xsl:call-template name="break">
					<xsl:with-param name="text" select="substring-after($text,'&#xa;')"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$text"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="ImageDescription">
		<TABLE width="98%" align="center" border="0" cellspacing="0" cellpadding="5" bgcolor="#DDDAD7">
			<TR>
				<TD>
					<TABLE width="100%" align="center" border="0" cellspacing="0" cellpadding="3" bgcolor="#FFFFFF">
						<TR>
							<TD>
								<TABLE width="100%" align="center" border="0" cellspacing="0" cellpadding="5" bgcolor="#FFFFFF">
									<TR>
										<TD height="20" width="40%" style="font-family: arial, helvetica; font-size: 8pt; font-weight: normal; padding: 5px;">
                      Image: <B>
												<xsl:value-of select="Name"/>
											</B>
										</TD>
										<TD width="30%"/>
									</TR>
									<TR>
										<TD height="20" width="30%" style="font-family: arial, helvetica; font-size: 8pt; font-weight: normal; color: 000000; padding: 5px;">
                      Size: <B>
												<xsl:value-of select="Size"/>
											</B>
										</TD>
									</TR>
									<TR>
										<TD width="20%" style="font-family: arial, helvetica; font-size: 8pt; font-weight: normal; color: 000000; padding: 5px;">
                      File Location: <B>
												<xsl:value-of select="FileLocation"/>
											</B>
										</TD>
									</TR>
									<TR>
										<TD height="20" width="30%" style="font-family: arial, helvetica; font-size: 8pt; font-weight: normal; color: 000000; padding: 5px;">
                      Start Time: <B>
												<xsl:value-of select="StartTime"/>
											</B>
										</TD>
									</TR>
									<TR>
										<TD height="20" width="30%" style="font-family: arial, helvetica; font-size: 8pt; font-weight: normal; color: 000000; padding: 5px;">
                      End Time: <B>
												<xsl:value-of select="EndTime"/>
											</B>
										</TD>
									</TR>
									<TR>
										<TD height="20" width="30%" style="font-family: arial, helvetica; font-size: 8pt; font-weight: normal; color: 000000; padding: 5px;">
                      Total Exposures: <B>
												<xsl:value-of select="FrameCount"/>
											</B>
										</TD>
									</TR>
									<xsl:if test="/Data/Image/Attachment[@Name='HardwareSetting']/@Software != ' ' or 0 &lt; count(/Data/Image/Attachment[@Name='MicroscopicParameters' and @Application='Huygens']) ">
										<TR>
											<TD height="20" width="30%" style="font-family: arial, helvetica; font-size: 8pt; font-weight: normal; color: 000000; padding: 5px;">
					Data from: 
													<xsl:choose>
														<xsl:when test="0 &lt; count(/Data/Image/Attachment[@Name='MicroscopicParameters' and @Application='Huygens'])">
															<b>Huygens</b>
															<xsl:if test="/Data/Image/Attachment[@Name='HardwareSetting']/@Software != ' ' ">
																based on image data from <xsl:value-of select="/Data/Image/Attachment[@Name='HardwareSetting']/@Software"/>
															</xsl:if>
														</xsl:when>
														<xsl:otherwise>
															<b><xsl:value-of select="/Data/Image/Attachment[@Name='HardwareSetting']/@Software"/></b>
														</xsl:otherwise>
													</xsl:choose>
											</TD>
										</TR>
									</xsl:if>
								</TABLE>
							</TD>
							<TD align="center" valign="center" rowspan="2">
								<A href="http://www.confocal-microscopy.com/" target="about:blank">
									<IMG src="LeicaLogo.jpg" border="0" alt="Leica Microsystems Heidelberg GmbH"/>
								</A>
							</TD>
						</TR>
					</TABLE>
				</TD>
			</TR>
		</TABLE>
		<xsl:if test="//User-Comment != ' '">
			<TABLE width="98%" align="center" border="0" cellspacing="0" cellpadding="5" bgcolor="#DDDAD7">
				<TR>
					<TD>
						<TABLE topmargin="0" leftmargin="0" width="100%" align="center" border="1" cellspacing="0" cellpadding="5" bgcolor="#FFFFFF">
							<TR style="font-family: arial, helvetica; font-size: 8pt; font-weight: normal; padding: 3px;">
								<TD colspan="2" width="35%">
									<xsl:call-template name="break"/>
								</TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
		</xsl:if>
		<HR width="98%"/>
		<TABLE width="98%" align="center" border="0" cellspacing="5" cellpadding="5">
			<TR>
				<TD align="left" style="font-family: arial, helvetica; font-size: 8pt; font-weight: normal; color: 000000; padding: 3px;">
					<b>Dimensions</b>
				</TD>
			</TR>
		</TABLE>
		<TABLE width="98%" align="center" border="0" cellspacing="0" cellpadding="5" bgcolor="#DDDAD7">
			<TR>
				<TD>
					<TABLE topmargin="0" leftmargin="0" width="100%" align="left" border="1" cellspacing="0" cellpadding="5" bgcolor="#FFFFFF">
						<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: bold; color: 000000; padding: 3px;">
							<TD>Dimension</TD>
							<TD>Logical Size</TD>
							<TD>Physical Length</TD>
							<TD>Physical Origin</TD>
							<TD>Pixel Size / Voxel Size</TD>
						</TR>
						<xsl:for-each select="Dimensions/DimensionDescription">
							<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
								<TD>
									<xsl:value-of select="@DimID"/>
								</TD>
								<TD>
									<xsl:value-of select="@NumberOfElements"/>
								</TD>
								<TD>
									<xsl:value-of select="@Length"/> &nbsp;<xsl:value-of select="@Unit"/>
								</TD>
								<TD>
									<xsl:value-of select="@Origin"/> &nbsp;<xsl:value-of select="@Unit"/>
								</TD>
								<TD>
									<xsl:value-of select="@Voxel"/> &nbsp;<xsl:value-of select="@Unit"/>
								</TD>
							</TR>
						</xsl:for-each>
					</TABLE>
				</TD>
			</TR>
		</TABLE>
		<TABLE width="98%" align="center" border="0" cellspacing="5" cellpadding="5">
			<TR>
				<TD align="left" style="font-family: arial, helvetica; font-size: 8pt; font-weight: normal; color: 000000; padding: 3px;">
					<b>Channels</b>
				</TD>
			</TR>
		</TABLE>
		<TABLE width="98%" align="center" border="0" cellspacing="0" cellpadding="5" bgcolor="#DDDAD7">
			<TR>
				<TD>
					<TABLE topmargin="0" leftmargin="0" width="100%" align="left" border="1" cellspacing="0" cellpadding="5" bgcolor="#FFFFFF">
						<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: bold; color: 000000; padding: 3px;">
							<TD colspan="2">LUT</TD>
							<TD>Resolution</TD>
							<TD>Min</TD>
							<TD>Max</TD>
							<TD>STED: DetectorMode / Huygens saturation factor / Wavelength</TD>
						</TR>
						<xsl:for-each select="Channels/ChannelDescription">
							<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
								<xsl:choose>
									<xsl:when test="0 != string-length(@LUTPNGImage)">
										<TD style="border-right: none">
											<xsl:value-of select="@LUTName"/> 
										</TD>
										<TD style="width:12.5%; background: #EEEEEE; border-left: none; ; padding-right:2px">
											<img style="align:center; valign:middle; width: 256px; height:18px " src="data:image/png;base64,{@LUTPNGImage}" />
										</TD> 
									</xsl:when>
									<xsl:otherwise>
										<TD colspan="2"> 
											<xsl:value-of select="@LUTName"/> 
										</TD>
									</xsl:otherwise>
								</xsl:choose>
								<TD>
									<xsl:value-of select="@Resolution"/>
								</TD>
								<TD>
									<xsl:value-of select="@Min"/> &nbsp;<xsl:value-of select="@Unit"/>
								</TD>
								<TD>
									<xsl:value-of select="@Max"/> &nbsp;<xsl:value-of select="@Unit"/>
								</TD>
								<td>
								<xsl:choose>
									<xsl:when test="0 &lt; string-length(@STEDDetectorModeName)">
										<xsl:value-of select="@STEDDetectorModeName"/>
									</xsl:when>
									<xsl:otherwise> --- </xsl:otherwise>
								</xsl:choose>
								/ 
								<xsl:choose>
									<xsl:when test="0 &lt; string-length(@STED_HuygensSaturationFactor)">
										<xsl:value-of select="@STED_HuygensSaturationFactor"/>
									</xsl:when>
									<xsl:otherwise>  --- </xsl:otherwise>
								</xsl:choose>
								/ 
								<xsl:choose>
									<xsl:when test="0 &lt; string-length(@STED_Wavelength)">
										<xsl:value-of select="@STED_Wavelength"/> nm
									</xsl:when>
									<xsl:otherwise>  --- </xsl:otherwise>
								</xsl:choose>
								</td>
							</TR>
						</xsl:for-each>
					</TABLE>
				</TD>
			</TR>
		</TABLE>
	</xsl:template>
	<xsl:template match="TimeStampList">
		<TABLE width="98%" align="center" border="0" cellspacing="5" cellpadding="5">
			<TR>
				<TD align="left" style="font-family: arial, helvetica; font-size: 8pt; font-weight: normal; color: 000000; padding: 3px;">
					<b>Time Stamps:</b> &nbsp;
        </TD>
			</TR>
		</TABLE>
		<DIV ID="ID_1" style="display:block;">
			<TABLE width="98%" align="center" border="0" cellspacing="0" cellpadding="5" bgcolor="#DDDAD7">
				<TR>
					<TD>
						<TABLE topmargin="0" leftmargin="0" width="100%" align="left" border="1" cellspacing="0" cellpadding="5" bgcolor="#FFFFFF">
							<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: bold; color: 000000; padding: 3px;">
								<TD>
                  Frame &nbsp; (<a href="javascript:Show()">Show All</a>)
                </TD>
								<TD>Relative Time (s)</TD>
								<TD>Absolute Time (h:m:s.ms)</TD>
								<TD>Date</TD>
							</TR>
							<xsl:for-each select="TimeStamp">
								<xsl:if test="not(position()!=1 and position()!=last())">
									<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
										<TD>
											<xsl:number value="position()" format="1 "/>
										</TD>
										<TD>
											<xsl:choose>
												<xsl:when test="@RelativeTime != ''">
													<xsl:value-of select="@RelativeTime"/>
												</xsl:when>
												<xsl:otherwise> --- </xsl:otherwise>
											</xsl:choose>
										</TD>
										<TD>
											<xsl:value-of select="@Time"/>.<xsl:value-of select="@MiliSeconds"/>
										</TD>
										<TD>
											<xsl:choose>
												<xsl:when test="@Date != ''">
													<xsl:value-of select="@Date"/>
												</xsl:when>
												<xsl:otherwise> --- </xsl:otherwise>
											</xsl:choose>
										</TD>
									</TR>
								</xsl:if>
							</xsl:for-each>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
			<BR/>
		</DIV>
		<DIV ID="ID_2" style="display:none;">
			<TABLE width="98%" align="center" border="0" cellspacing="0" cellpadding="5" bgcolor="#DDDAD7">
				<TR>
					<TD>
						<TABLE topmargin="0" leftmargin="0" width="100%" align="left" border="1" cellspacing="0" cellpadding="5" bgcolor="#FFFFFF">
							<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: bold; color: 000000; padding: 3px;">
								<TD>
                  Frame &nbsp; (<a href="javascript:Show()">Show first + last</a>)
                </TD>
								<TD>Relative Time</TD>
								<TD>Absolute Time</TD>
								<TD>Date</TD>
							</TR>
							<xsl:for-each select="TimeStamp">
								<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
									<TD>
										<xsl:number value="position()" format="1 "/>
									</TD>
									<TD>
										<xsl:value-of select="@RelativeTime"/>
									</TD>
									<TD>
										<xsl:value-of select="@Time"/>.<xsl:value-of select="@MiliSeconds"/>
									</TD>
									<TD>
										<xsl:value-of select="@Date"/>
									</TD>
								</TR>
							</xsl:for-each>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
		</DIV>
		<BR/>
	</xsl:template>
	<xsl:template match="FRAPplus">
		<TABLE width="98%" align="center" border="0" cellspacing="5" cellpadding="5">
			<TR>
				<TD align="left" style="font-family: arial, helvetica; font-size: 8pt; font-weight: normal; color: 000000; padding: 3px;">
					<b>Bleach Settings</b>
				</TD>
			</TR>
		</TABLE>
		<TABLE width="98%" align="center" border="0" cellspacing="0" cellpadding="5" bgcolor="#DDDAD7">
			<TR>
				<TD>
					<TABLE topmargin="0" leftmargin="0" width="100%" align="left" border="1" cellspacing="0" cellpadding="5" bgcolor="#FFFFFF">
						<xsl:for-each select="Block_FRAP">
							<xsl:for-each select="Block_FRAP_Bleach_Info/LaserLineSettingArray">
								<xsl:for-each select="LaserLineSetting">
									<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
										<TD width="40%">
                      Laser Line <xsl:value-of select="@AotfType"/> (<xsl:value-of select="@LaserLine"/>nm)
                    </TD>
										<TD>
											<xsl:value-of select="@IntensityShow"/>
										</TD>
									</TR>
								</xsl:for-each>
							</xsl:for-each>
						</xsl:for-each>
						<xsl:for-each select="Block_FRAP_XT">
							<xsl:for-each select="Block_FRAP_XT_Bleach_Info/LaserLineSettingArray">
								<xsl:for-each select="LaserLineSetting">
									<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
										<TD width="40%">
                      Laser Line <xsl:value-of select="@AotfType"/> (<xsl:value-of select="@LaserLine"/>nm)
                    </TD>
										<TD>
											<xsl:value-of select="@IntensityShow"/>
										</TD>
									</TR>
								</xsl:for-each>
							</xsl:for-each>
						</xsl:for-each>
					</TABLE>
				</TD>
			</TR>
		</TABLE>
		<TABLE width="98%" align="center" border="0" cellspacing="5" cellpadding="5">
			<TR>
				<TD align="left" style="font-family: arial, helvetica; font-size: 8pt; font-weight: normal; color: 000000; padding: 3px;">
					<b>Pre/Post Settings</b>
				</TD>
			</TR>
		</TABLE>
		<TABLE width="98%" align="center" border="0" cellspacing="0" cellpadding="5" bgcolor="#DDDAD7">
			<TR>
				<TD>
					<TABLE topmargin="0" leftmargin="0" width="100%" align="left" border="1" cellspacing="0" cellpadding="5" bgcolor="#FFFFFF">
						<xsl:for-each select="Block_FRAP">
							<xsl:for-each select="Block_FRAP_PrePost_Info/LaserLineSettingArray">
								<xsl:for-each select="LaserLineSetting">
									<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
										<TD width="40%">
                      Laser Line <xsl:value-of select="@AotfType"/> (<xsl:value-of select="@LaserLine"/>nm)
                    </TD>
										<TD>
											<xsl:value-of select="@IntensityShow"/>
										</TD>
									</TR>
								</xsl:for-each>
							</xsl:for-each>
						</xsl:for-each>
						<xsl:for-each select="Block_FRAP_XT">
							<xsl:for-each select="Block_FRAP_XT_PrePost_Info/LaserLineSettingArray">
								<xsl:for-each select="LaserLineSetting">
									<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
										<TD width="40%">
                      Laser Line <xsl:value-of select="@AotfType"/> (<xsl:value-of select="@LaserLine"/>nm)
                    </TD>
										<TD>
											<xsl:value-of select="@IntensityShow"/>
										</TD>
									</TR>
								</xsl:for-each>
							</xsl:for-each>
						</xsl:for-each>
					</TABLE>
				</TD>
			</TR>
		</TABLE>
	</xsl:template>
	<xsl:template match="LDM_Block_Sequential_List">
		<xsl:for-each select="ATLConfocalSettingDefinition">
			<TABLE width="98%" align="center" border="0" cellspacing="5" cellpadding="5">
				<TR>
					<TD align="left" style="font-family: arial, helvetica; font-size: 8pt; font-weight: normal; color: 000000; padding: 3px;">
						<b>
              Sequential Setting Nr.<xsl:number value="position()" format="1 "/>
						</b>
					</TD>
				</TR>
			</TABLE>
			<TABLE width="98%" align="center" border="0" cellspacing="0" cellpadding="5" bgcolor="#DDDAD7">
				<TR>
					<TD>
						<TABLE topmargin="0" leftmargin="0" width="100%" align="left" border="1" cellspacing="0" cellpadding="5" bgcolor="#FFFFFF">
							<xsl:if test="@Pinhole">
								<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
									<TD width="40%">
										Pinhole
									</TD>
									<TD>
										<xsl:value-of select="@Pinhole"/>
									</TD>
								</TR>
							</xsl:if>
							<xsl:if test="@PinholeAiry">
								<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
									<TD width="40%">
										PinholeAiry
									</TD>
									<TD>
										<xsl:value-of select="@PinholeAiry"/>
									</TD>
								</TR>
							</xsl:if>
							<xsl:choose>
								<xsl:when test="@EmissionWavelengthForPinholeAiryCalculation">
									<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
										<TD width="40%">
											EmissionWavelength for PinholeAiry Calculation
										</TD>
										<TD>
											<xsl:value-of select="@EmissionWavelengthForPinholeAiryCalculation"/>
										</TD>
									</TR>
								</xsl:when>
							</xsl:choose>
							<xsl:for-each select="FilterWheel/Wheel">
								<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
									<TD width="40%">
										<xsl:value-of select="@FilterWheelName"/>
									</TD>
									<TD>
										<xsl:value-of select="@FilterName"/>
									</TD>
								</TR>
							</xsl:for-each>
							<xsl:for-each select="DetectorList/Detector">
								<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
									<TD width="40%">
										<xsl:value-of select="@Name"/> &nbsp; <xsl:value-of select="@Band"/>
									</TD>
									<TD>
										<xsl:value-of select="@ActiveShow"/>, Gain: <xsl:value-of select="@GainShow"/>, Offset: <xsl:value-of select="@OffsetShow"/>
									</TD>
								</TR>
								<xsl:if test="@CanDoTimeGate='1'">
									<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
										<TD width="40%">
											<xsl:value-of select="@Type"/> Timegate (<xsl:value-of select="@TimeGateWavelength"/>)
                  </TD>
										<TD>
											<xsl:value-of select="@TimegateActiveShow"/>, Gate Start: <xsl:value-of select="@TimeGatePulseStart"/>, Gate End: <xsl:value-of select="@TimeGatePulseEnd"/>
										</TD>
									</TR>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="AotfList/Aotf">
								<xsl:for-each select="LaserLineSetting">
									<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
										<xsl:if test="@LaserLine &gt; 0">
											<TD width="40%">
                          Laser Line <xsl:value-of select="@LightSourceName"/> (
                          <xsl:choose>
													<xsl:when test="@LaserLineDouble!=''">
														<xsl:value-of select="@LaserLineDouble"/>
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="@LaserLine"/>
													</xsl:otherwise>
												</xsl:choose>
                          nm)                  
                      </TD>
											<TD>
												<xsl:value-of select="@IntensityShow"/>
											</TD>
										</xsl:if>
									</TR>
								</xsl:for-each>
							</xsl:for-each>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="Attachment">
		<xsl:if test="@Name='HardwareSetting'">
			<TABLE width="98%" align="center" border="0" cellspacing="5" cellpadding="5">
				<TR>
					<TD align="left" style="font-family: arial, helvetica; font-size: 8pt; font-weight: normal; color: 000000; padding: 3px;">
						<b>Confocal Settings</b>
					</TD>
				</TR>
			</TABLE>
			<TABLE width="98%" align="center" border="0" cellspacing="0" cellpadding="5" bgcolor="#DDDAD7">
				<TR>
					<TD>
						<TABLE topmargin="0" leftmargin="0" width="100%" align="left" border="1" cellspacing="0" cellpadding="5" bgcolor="#FFFFFF">
							<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: bold; color: 000000; padding: 3px;">
								<TD width="40%">
                  Name
                </TD>
								<TD>
                  Value
                </TD>
							</TR>
							<xsl:for-each select="ATLConfocalSettingDefinition">
								<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
									<TD width="40%">
                    Scan Mode
                  </TD>
									<TD>
										<xsl:value-of select="@ScanMode"/>
									</TD>
								</TR>
								<xsl:choose>
									<xsl:when test="@ScanDirectionXName">
										<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
											<TD width="40%">
							Scan Direction X
						  </TD>
											<TD>
												<xsl:value-of select="@ScanDirectionXName"/>
											</TD>
										</TR>
									</xsl:when>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="@ScanSpeed">
										<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
											<TD width="40%">
							Scan Speed
						  </TD>
											<TD>
												<xsl:value-of select="@ScanSpeed"/>
											</TD>
										</TR>
									</xsl:when>
								</xsl:choose>
								<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
									<TD width="40%">
                    Version Number
                  </TD>
									<TD>
										<xsl:value-of select="@VersionNumber"/>
									</TD>
								</TR>
								<xsl:choose>
									<xsl:when test="@CanDoSTED">
										<xsl:choose>
											<xsl:when test="@CanDoSTED='1'">
												<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px">
													<TD width="40%">
														IsSTEDActive
													</TD>
													<TD>
														<xsl:value-of select="@IsSTEDActive"/>
													</TD>
												</TR>
											</xsl:when>
										</xsl:choose>
									</xsl:when>
									<xsl:otherwise>
										<!-- show always for old images which do not have CanDoSTED attribute -->
										<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px">
											<TD width="40%">
												IsSTEDActive
											</TD>
											<TD>
												<xsl:value-of select="@IsSTEDActive"/>
											</TD>
										</TR>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:if test="@StagePosX != ''">
									<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
										<TD width="40%">
											StagePosX
										</TD>
										<TD>
											<xsl:value-of select="@StagePosX"/>
										</TD>
									</TR>
								</xsl:if>
								<xsl:if test="@StagePosY != ''">
									<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
										<TD width="40%">
											StagePosY
										</TD>
										<TD>
											<xsl:value-of select="@StagePosY"/>
										</TD>
									</TR>
								</xsl:if>
								<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
									<TD width="40%">
                    ZPosition
                  </TD>
									<TD>
										<xsl:value-of select="@ZPosition"/>
									</TD>
								</TR>
								<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
									<TD width="40%">
                    IsSuperZ
                  </TD>
									<TD>
										<xsl:value-of select="@IsSuperZ"/>
									</TD>
								</TR>
								<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
									<TD width="40%">
                    Magnification
                  </TD>
									<TD>
										<xsl:value-of select="@Magnification"/>
									</TD>
								</TR>
								<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
									<TD width="40%">
                    ObjectiveName
                  </TD>
									<TD>
										<xsl:value-of select="@ObjectiveName"/>
									</TD>
								</TR>
								<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
									<TD width="40%">
                    Immersion
                    </TD>
									<TD>
										<xsl:choose>
											<xsl:when test="@Immersion != ''">
												<xsl:value-of select="@Immersion"/>
											</xsl:when>
											<xsl:otherwise> --- </xsl:otherwise>
										</xsl:choose>
									</TD>
								</TR>
								<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
									<TD width="40%">
                    NumericalAperture
                  </TD>
									<TD>
										<xsl:value-of select="@NumericalAperture"/>
									</TD>
								</TR>
								<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
									<TD width="40%">
                    RefractionIndex
                  </TD>
									<TD>
										<xsl:value-of select="@RefractionIndex"/>
									</TD>
								</TR>
								<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
									<TD width="40%">
                    Zoom
                  </TD>
									<TD>
										<xsl:value-of select="@Zoom"/>
									</TD>
									</TR>
								<xsl:choose>
									<xsl:when test="@CanDoOpticalZoom='1'">
										<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
											<TD width="40%">
												OpticalZoom
											</TD>
											<TD>
												<xsl:value-of select="@OpticalZoom"/>
											</TD>
										</TR>
									</xsl:when>
								</xsl:choose>
								<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
									<TD width="40%">
                    Pinhole
                  </TD>
									<TD>
										<xsl:value-of select="@Pinhole"/>
									</TD>
								</TR>
								<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
									<TD width="40%">
                    PinholeAiry
                  </TD>
									<TD>
										<xsl:value-of select="@PinholeAiry"/>
									</TD>
								</TR>
								<xsl:choose>
									<xsl:when test="@EmissionWavelengthForPinholeAiryCalculation">
										<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
											<TD width="40%">
												EmissionWavelength for PinholeAiry Calculation
											</TD>
											<TD>
												<xsl:value-of select="@EmissionWavelengthForPinholeAiryCalculation"/>
											</TD>
										</TR>
									</xsl:when>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="@MotCorrPosition">
										<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
											<TD width="40%">
							MotCorrPosition
						  </TD>
											<TD>
												<xsl:value-of select="@MotCorrPosition"/>%
											</TD>
										</TR>
									</xsl:when>
								</xsl:choose>
								<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
									<TD width="40%">
                    FrameAverage
                  </TD>
									<TD>
										<xsl:value-of select="@FrameAverage"/>
									</TD>
								</TR>
								<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
									<TD width="40%">
                    LineAverage
                  </TD>
									<TD>
										<xsl:value-of select="@LineAverage"/>
									</TD>
								</TR>
								<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
									<TD width="40%">
										FrameAccumulation
									</TD>
									<TD>
										<xsl:value-of select="@FrameAccumulation"/>
									</TD>
								</TR>
								<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
									<TD width="40%">
										Line_Accumulation
									</TD>
									<TD>
										<xsl:value-of select="@Line_Accumulation"/>
									</TD>
								</TR>
								<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
									<TD width="40%">
                    IsUserSettingNameSet
                  </TD>
									<TD>
										<xsl:value-of select="@IsUserSettingNameSet"/>
									</TD>
								</TR>
								<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
									<TD width="40%">
                    IsRoiScanEnable
                  </TD>
									<TD>
										<xsl:value-of select="@IsRoiScanEnable"/>
									</TD>
								</TR>
							</xsl:for-each>
						</TABLE>
					</TD>
				</TR>
				<!--
        <TR>
          <TD>
            Spectro

            <TABLE topmargin="0" leftmargin="0" width="100%" align="left" border="1" cellspacing="0" cellpadding="5" bgcolor="#FFFFFF">
              <TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: bold; color: 000000; padding: 3px;">
                <TD width="40%">
                  Channel Name
                </TD>
                <TD >
                  Left
                </TD>
                <TD >
                  Right
                </TD>
                <TD >
                  Dye Name
                </TD>

              </TR>

              <xsl:for-each select="ATLConfocalSettingDefinition/Spectro/MultiBand">
                <TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: bold; color: 000000; padding: 3px;">
                  <TD>
                    <xsl:value-of select="@ChannelName"/>
                  </TD>
                  <TD >
                    <xsl:value-of select="@LeftWorld"/>
                  </TD>
                  <TD>
                    <xsl:value-of select="@RightWorld"/>
                  </TD>
                  <TD >
                    <xsl:value-of select="@DyeName"/>
                  </TD>
                </TR>
              </xsl:for-each>
            </TABLE>
          </TD>
        </TR>
        -->
				<TR>
					<TD>
            Filter Wheels / Other Motorized Devices

            <TABLE topmargin="0" leftmargin="0" width="100%" align="left" border="1" cellspacing="0" cellpadding="5" bgcolor="#FFFFFF">
							<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: bold; color: 000000; padding: 3px;">
								<TD width="40%">
                  Device Name
                </TD>
								<TD>
                  Filter Name/Position
                </TD>
							</TR>
							<xsl:for-each select="ATLConfocalSettingDefinition/FilterWheel/Wheel">
								<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
									<TD>
										<xsl:value-of select="@FilterWheelName"/>
									</TD>
									<TD>
										<xsl:choose>
											<xsl:when test="@FilterDisplayValue!=''">
												<xsl:value-of select="@FilterDisplayValue"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="@FilterName"/>
											</xsl:otherwise>
										</xsl:choose>
									</TD>
								</TR>
							</xsl:for-each>
						</TABLE>
					</TD>
				</TR>
				<TR>
					<TD>
            Lasers

            <TABLE topmargin="0" leftmargin="0" width="100%" align="left" border="1" cellspacing="0" cellpadding="5" bgcolor="#FFFFFF">
				<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: bold; color: 000000; padding: 3px;">
					<TD width="40%">
						LaserName
					</TD>
					<TD>
						OutputPower
					</TD>
				</TR>
				<xsl:for-each select="ATLConfocalSettingDefinition/LaserArray/Laser">
					<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: bold; color: 000000; padding: 3px;">
						<TD>
							<xsl:value-of select="@LaserName"/>
						</TD>
						<TD>
							<xsl:choose>
								<xsl:when test="@OutputPowerDisplay">
									<xsl:value-of select="@OutputPowerDisplay"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="@OutputPower"/> ?
								</xsl:otherwise>
							</xsl:choose>
						</TD>
					</TR>
				</xsl:for-each>
			</TABLE>
		</TD>
			</TR>
			<TR>
					<TD>
            Laser Lines

            <TABLE topmargin="0" leftmargin="0" width="100%" align="left" border="1" cellspacing="0" cellpadding="5" bgcolor="#FFFFFF">
							<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: bold; color: 000000; padding: 3px;">
								<TD width="40%">
                  Laser Line
                </TD>
								<TD>
                  Intensity
                </TD>
							</TR>
							<xsl:for-each select="ATLConfocalSettingDefinition/AotfList/Aotf/LaserLineSetting">
								<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
									<xsl:if test="@LaserLine &gt; 0">
										<TD>
											<xsl:value-of select="@LightSourceName"/> (
                      <xsl:choose>
												<xsl:when test="@LaserLineDouble!=''">
													<xsl:value-of select="@LaserLineDouble"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="@LaserLine"/>
												</xsl:otherwise>
											</xsl:choose>
                      nm)
                    </TD>
										<TD>
											<xsl:value-of select="@IntensityShow"/>
										</TD>
									</xsl:if>
								</TR>
							</xsl:for-each>
						</TABLE>
					</TD>
				</TR>
				<TR>
					<TD>
            Detectors

            <TABLE topmargin="0" leftmargin="0" width="100%" align="left" border="1" cellspacing="0" cellpadding="5" bgcolor="#FFFFFF">
							<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: bold; color: 000000; padding: 3px;">
								<TD width="10%">
                  Name
                </TD>
								<TD>
                  Channel
                </TD>
								<TD width="25%">
                  Type
                </TD>
								<TD>
                  Location
                </TD>
								<TD>
                  Active
                </TD>
								<TD>
                  Gain
                </TD>
								<TD>
                  Offset
                </TD>
								<TD>
                  Gate Start
                </TD>
								<TD>
                  Gate End
                </TD>
								<TD>
                  Gate Ref. Wavelength
                </TD>
							</TR>
							<xsl:for-each select="ATLConfocalSettingDefinition/DetectorList/Detector">
								<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
									<TD>
										<xsl:value-of select="@Name"/>
									</TD>
									<TD>
										<xsl:value-of select="@ChannelName"/>
									</TD>
									<TD>
										<xsl:value-of select="@Type"/> &nbsp; 
										<xsl:value-of select="@Band"/> &nbsp; 
										<xsl:choose>
											<xsl:when test="@AcquisitionModeName = 'PhotonIntegration'">
												Standard mode
											</xsl:when>
											<xsl:otherwise> 
												<xsl:value-of select="@AcquisitionModeName"/>
											</xsl:otherwise>
										</xsl:choose>
										<xsl:if test="@IsHPDOverloaded='1' ">
											&nbsp; <font color="red">Overloaded</font>											
										</xsl:if>
									</TD>
									<TD>
										<xsl:choose>
											<xsl:when test="@ScanType != ''">
												<xsl:value-of select="@ScanType"/>
											</xsl:when>
											<xsl:otherwise> --- </xsl:otherwise>
										</xsl:choose>
									</TD>
									<TD>
										<xsl:choose>
											<xsl:when test="@ActiveShow != ''">
												<xsl:value-of select="@ActiveShow"/>
											</xsl:when>
											<xsl:otherwise> --- </xsl:otherwise>
										</xsl:choose>
									</TD>
									<TD align="right">
										<xsl:value-of select="@Gain"/>
									</TD>
									<TD align="right">
										<xsl:value-of select="@Offset"/>
									</TD>
									<xsl:choose>
										<xsl:when test="@CanDoTimeGate='1' ">
											<xsl:choose>
												<xsl:when test="@IsTimeGateActivated='1' ">
													<TD>
														<xsl:choose>
															<xsl:when test="@TimeGatePulseStart != ''">
																<xsl:value-of select="@TimeGatePulseStart"/>
															</xsl:when>
															<xsl:otherwise> --- </xsl:otherwise>
														</xsl:choose>
													</TD>
													<TD>
														<xsl:choose>
															<xsl:when test="@TimeGatePulseEnd != ''">
																<xsl:value-of select="@TimeGatePulseEnd"/>
															</xsl:when>
															<xsl:otherwise> --- </xsl:otherwise>
														</xsl:choose>
													</TD>
													<TD>
														<xsl:choose>
															<xsl:when test="@TimeGateWavelength != ''">
																<xsl:value-of select="@TimeGateWavelength"/>
															</xsl:when>
															<xsl:otherwise> --- </xsl:otherwise>
														</xsl:choose>
													</TD>
												</xsl:when>
												<xsl:otherwise>
													<TD colspan="3" align="center"> 
														-- Time Gating not activated --
													</TD>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:when>
										<xsl:otherwise>
											<TD colspan="3" align="center" style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: gray; padding: 3px;"> 
												-- Time Gating not supported --
											</TD>
										</xsl:otherwise>
									</xsl:choose>
								</TR>
							</xsl:for-each>
						</TABLE>
					</TD>
				</TR>
				</TABLE>
		</xsl:if>
		<xsl:if test="@Name='ProcessingHistory'">
			<TABLE width="98%" align="center" border="0" cellspacing="0" cellpadding="5">
				<TR>
					<TD align="left" style="font-family: arial, helvetica; font-size: 8pt; font-weight: normal; color: 000000; padding: 3px;">
						<B> Processing History: </B>
					</TD>
				</TR>
				<xsl:for-each select="ProcessingHistory">
					<xsl:sort select="@CreationTime" order="descending"/>
					<xsl:choose>
						<xsl:when test="@ProcessingType = 'OnlineDyeSeparation_Target' and contains(@TargetUniqueIDList, /Data/Image/ImageDescription/UniqueID ) ">
							<tr>
								<td>
									<TABLE width="98%" align="center" border="0" cellspacing="5" cellpadding="5">
										<TR>
											<TD align="left" style="font-family: arial, helvetica; font-size: 7pt; font-weight: bold; color: 000000; padding: 3px;">
												<B>
													<xsl:value-of select="@CreationTime"/>
												</B>
											</TD>
											<TD align="left" style="font-family: arial, helvetica; font-size: 7pt; font-weight: bold; color: 000000; padding: 3px;">
												<B> Applied OnlineDyeSeparation parameters </B>
											</TD>
										</TR>
									</TABLE>
									<TABLE width="98%" align="center" border="0" cellspacing="0" cellpadding="5" bgcolor="#DDDAD7">
										<TR>
											<TD>
												<TABLE topmargin="0" leftmargin="0" width="100%" align="left" border="1" cellspacing="0" cellpadding="5" bgcolor="#FFFFFF">
													<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
														<td>
															<xsl:copy-of select="TR"/>
														</td>
													</TR>
												</TABLE>
											</TD>
										</TR>
									</TABLE>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center" border="0" cellspacing="5" cellpadding="5"> &nbsp;</td>
							</tr>
						</xsl:when>
						<xsl:when test="@ProcessingType = 'OnlineDyeSeparation_Source' and contains(@SourceUniqueIDList, /Data/Image/ImageDescription/UniqueID ) ">
							<TR bgcolor="#DDDAD7">
								<TD align="left" style="font-family: arial, helvetica; font-size: 7pt; font-weight: bold; color: 000000; padding: 3px;">
									<B>
										<xsl:value-of select="@CreationTime"/>
									</B>
								</TD>
								<TD align="left" style="font-family: arial, helvetica; font-size: 7pt; font-weight: bold; color: 000000; padding: 3px;">
									<B> Active OnlineDyeSeparation parameters </B>
								</TD>
							</TR>
							<TR align="center" border="0" cellspacing="0" cellpadding="5" bgcolor="#DDDAD7">
								<TD>
									<TABLE topmargin="0" leftmargin="0" width="100%" align="left" border="1" cellspacing="0" cellpadding="5" bgcolor="#FFFFFF">
										<TR style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
											<td>
												<xsl:copy-of select="TR"/>
											</td>
										</TR>
									</TABLE>
								</TD>
							</TR>
							<tr>
								<td colspan="2" align="center" border="0" cellspacing="5" cellpadding="5"> &nbsp;</td>
							</tr>
						</xsl:when>
						<xsl:when test="@ProcessingType = 'LocalizeGSDEvents' ">
							<TR border="1" bgcolor="#DDDAD7">
								<TD align="left" style="font-family: arial, helvetica; font-size: 7pt; font-weight: bold; color: 000000; padding: 3px;">
									<B>
										<xsl:value-of select="@CreationTime"/>
									</B>
								</TD>
								<TD align="left" style="font-family: arial, helvetica; font-size: 7pt; font-weight: bold; color: 000000; padding: 3px;">
									<B> GSD event localisation</B>
								</TD>
							</TR>
							<TR border="1" bgcolor="#DDDAD7">
								<TD colspan="2" border="0" cellspacing="0" cellpadding="0">
									<TABLE ID="ID_2001" style="display:block;" topmargin="0" leftmargin="0" width="100%" align="left" border="1" cellspacing="0" cellpadding="5" bgcolor="#FFFFFF">
										<xsl:copy-of select="TR"/>
										<tr style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
											<td>Name Of Source Image</td>
											<td>
												<xsl:copy-of select="Data/Image/ImageDescription/Name"/>
											</td>
										</tr>
										<tr bgcolor="#DDDAD7">
											<td colspan="2" align="left" style="font-family: arial, helvetica; font-size: 8pt; font-weight: normal; color: 000000; padding: 3px;">
												<B>Source Image &nbsp;  (<a href="javascript:ShowLocalizeGSDEventsDetails()">Show Information</a>) </B>
											</td>
										</tr>
									</TABLE>
									<TABLE ID="ID_2002" style="display:none;" topmargin="0" leftmargin="0" width="100%" align="left" border="1" cellspacing="0" cellpadding="5" bgcolor="#FFFFFF">
										<xsl:copy-of select="TR"/>
										<tr bgcolor="#DDDAD7">
											<td colspan="2" align="left" style="font-family: arial, helvetica; font-size: 8pt; font-weight: normal; color: 000000; padding: 3px;">
												<B>Source Image &nbsp;  (<a href="javascript:ShowLocalizeGSDEventsDetails()">Hide</a>) </B>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<xsl:apply-templates select="Data"/>
											</td>
										</tr>
									</TABLE>
								</TD>
							</TR>
						</xsl:when>
						<xsl:when test="@ProcessingType = 'GISTDrawHighresImage' ">
							<TR topmargin="0" leftmargin="0" border="0" bgcolor="#DDDAD7">
								<TD topmargin="0" leftmargin="0" align="left" style="font-family: arial, helvetica; font-size: 8pt; font-weight: normal; color: 000000; padding: 3px;">
									<B>
										<xsl:value-of select="@CreationTime"/>
									</B>
								</TD>
								<TD align="left" style="font-family: arial, helvetica; font-size: 7pt; font-weight: bold; color: 000000; padding: 3px;">
									<B> Draw GSD highresolution image</B>
								</TD>
							</TR>
							<TR border="1" bgcolor="#DDDAD7">
								<TD colspan="2" border="0" cellspacing="0" cellpadding="0">
									<TABLE ID="ID_2003" style="display:block;" topmargin="0" leftmargin="0" width="100%" align="left" border="1" cellspacing="0" cellpadding="5" bgcolor="#FFFFFF">
										<xsl:copy-of select="TR"/>
										<tr style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
											<td>Name Of Source GSD EventList</td>
											<td>
												<xsl:copy-of select="Data/GISTEventList/GISTEventListDescription/Name"/>
											</td>
										</tr>
										<tr bgcolor="#DDDAD7">
											<td colspan="2" align="left" style="font-family: arial, helvetica; font-size: 8pt; font-weight: normal; color: 000000; padding: 3px;">
												<B>Source Image: &nbsp;  (<a href="javascript:ShowGISTDrawHighresImageDetails()">Show Information</a>) </B>
											</td>
										</tr>
									</TABLE>
									<TABLE ID="ID_2004" style="display:none;" topmargin="0" leftmargin="0" width="100%" align="left" border="1" cellspacing="0" cellpadding="5" bgcolor="#FFFFFF">
										<xsl:copy-of select="TR"/>
										<tr style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
											<td>Name Of Source GSD EventList</td>
											<td>
												<xsl:copy-of select="Data/GISTEventList/GISTEventListDescription/Name"/>
											</td>
										</tr>
										<tr bgcolor="#DDDAD7">
											<td colspan="2" align="left" style="font-family: arial, helvetica; font-size: 8pt; font-weight: normal; color: 000000; padding: 3px;">
												<B>Source Image: &nbsp;  (<a href="javascript:ShowGISTDrawHighresImageDetails()">Hide</a>) </B>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<xsl:apply-templates select="Data"/>
											</td>
										</tr>
									</TABLE>
								</TD>
							</TR>
						</xsl:when>
						<xsl:when test="@ProcessingType = 'GSDMergeEventList' ">
							<TR topmargin="0" leftmargin="0" border="0" bgcolor="#DDDAD7">
								<TD topmargin="0" leftmargin="0" align="left" style="font-family: arial, helvetica; font-size: 8pt; font-weight: normal; color: 000000; padding: 3px;">
									<B>
										<xsl:value-of select="@CreationTime"/>
									</B>
								</TD>
								<TD align="left" style="font-family: arial, helvetica; font-size: 7pt; font-weight: bold; color: 000000; padding: 3px;">
									<B> Merge GSD Eventlist</B>
								</TD>
							</TR>
							<TR border="1" bgcolor="#DDDAD7">
								<TD colspan="2" border="0" cellspacing="0" cellpadding="0">
									<TABLE ID="ID_2005" style="display:block;" topmargin="0" leftmargin="0" width="100%" align="left" border="1" cellspacing="0" cellpadding="5" bgcolor="#FFFFFF">
										<xsl:copy-of select="TR"/>
										<tr style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
											<td>Name Of Source GSD EventList</td>
											<td>
												<xsl:copy-of select="Data/GISTEventList/GISTEventListDescription/Name"/>
											</td>
										</tr>
										<tr bgcolor="#DDDAD7">
											<td colspan="2" align="left" style="font-family: arial, helvetica; font-size: 8pt; font-weight: normal; color: 000000; padding: 3px;">
												<B>GSD Eventlist &nbsp;  (<a href="javascript:ShowGSDMergeEventListDetails()">Show Information</a>) </B>
											</td>
										</tr>
									</TABLE>
									<TABLE ID="ID_2006" style="display:none;" topmargin="0" leftmargin="0" width="100%" align="left" border="1" cellspacing="0" cellpadding="5" bgcolor="#FFFFFF">
										<xsl:copy-of select="TR"/>
										<tr style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
											<td>Name Of Source GSD EventList</td>
											<td>
												<xsl:copy-of select="Data/GISTEventList/GISTEventListDescription/Name"/>
											</td>
										</tr>
										<tr bgcolor="#DDDAD7">
											<td colspan="2" align="left" style="font-family: arial, helvetica; font-size: 8pt; font-weight: normal; color: 000000; padding: 3px;">
												<B>GSD Eventlist &nbsp;  (<a href="javascript:ShowGSDMergeEventListDetails()">Hide</a>) </B>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<xsl:apply-templates select="Data"/>
											</td>
										</tr>
									</TABLE>
								</TD>
							</TR>
						</xsl:when>
						<xsl:when test="@ProcessingType = 'FilterGSDEventList' ">
							<TR topmargin="0" leftmargin="0" border="0" bgcolor="#DDDAD7">
								<TD topmargin="0" leftmargin="0" align="left" style="font-family: arial, helvetica; font-size: 8pt; font-weight: normal; color: 000000; padding: 3px;">
									<B>
										<xsl:value-of select="@CreationTime"/>
									</B>
								</TD>
								<TD align="left" style="font-family: arial, helvetica; font-size: 7pt; font-weight: bold; color: 000000; padding: 3px;">
									<B> Filter GSD Eventlist</B>
								</TD>
							</TR>
							<TR border="1" bgcolor="#DDDAD7">
								<TD colspan="2" border="0" cellspacing="0" cellpadding="0">
									<TABLE ID="ID_2007" style="display:block;" topmargin="0" leftmargin="0" width="100%" align="left" border="1" cellspacing="0" cellpadding="5" bgcolor="#FFFFFF">
										<xsl:copy-of select="TR"/>
										<tr style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
											<td>Name Of Source GSD EventList</td>
											<td>
												<xsl:copy-of select="Data/GISTEventList/GISTEventListDescription/Name"/>
											</td>
										</tr>
										<tr bgcolor="#DDDAD7">
											<td colspan="2" align="left" style="font-family: arial, helvetica; font-size: 8pt; font-weight: normal; color: 000000; padding: 3px;">
												<B>GSD Eventlist &nbsp;  (<a href="javascript:ShowFilterGSDEventListDetails()">Show Information</a>) </B>
											</td>
										</tr>
									</TABLE>
									<TABLE ID="ID_2008" style="display:none;" topmargin="0" leftmargin="0" width="100%" align="left" border="1" cellspacing="0" cellpadding="5" bgcolor="#FFFFFF">
										<xsl:copy-of select="TR"/>
										<tr style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
											<td>Name Of Source GSD EventList</td>
											<td>
												<xsl:copy-of select="Data/GISTEventList/GISTEventListDescription/Name"/>
											</td>
										</tr>
										<tr bgcolor="#DDDAD7">
											<td colspan="2" align="left" style="font-family: arial, helvetica; font-size: 8pt; font-weight: normal; color: 000000; padding: 3px;">
												<B>GSD Eventlist &nbsp;  (<a href="javascript:ShowFilterGSDEventListDetails()">Hide</a>) </B>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<xsl:apply-templates select="Data"/>
											</td>
										</tr>
									</TABLE>
								</TD>
							</TR>
						</xsl:when>
						<xsl:when test="@ProcessingType = 'DriftCompensation' ">
							<TR topmargin="0" leftmargin="0" border="0" bgcolor="#DDDAD7">
								<TD topmargin="0" leftmargin="0" align="left" style="font-family: arial, helvetica; font-size: 8pt; font-weight: normal; color: 000000; padding: 3px;">
									<B>
										<xsl:value-of select="@CreationTime"/>
									</B>
								</TD>
								<TD align="left" style="font-family: arial, helvetica; font-size: 7pt; font-weight: bold; color: 000000; padding: 3px;">
									<B> Drift Compensation </B>
								</TD>
							</TR>
							<TR border="1" bgcolor="#DDDAD7">
								<TD colspan="2" border="0" cellspacing="0" cellpadding="0">
									<TABLE ID="ID_2009" style="display:block;" topmargin="0" leftmargin="0" width="100%" align="left" border="1" cellspacing="0" cellpadding="5" bgcolor="#FFFFFF">
										<xsl:copy-of select="TR"/>
										<tr style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
											<td>Name Of Source GSD EventList</td>
											<td>
												<xsl:copy-of select="Data/GISTEventList/GISTEventListDescription/Name"/>
											</td>
										</tr>
										<tr bgcolor="#DDDAD7">
											<td colspan="2" align="left" style="font-family: arial, helvetica; font-size: 8pt; font-weight: normal; color: 000000; padding: 3px;">
												<B>GSD Eventlist &nbsp;  (<a href="javascript:ShowDriftCompensationDetails()">Show Information</a>) </B>
											</td>
										</tr>
									</TABLE>
									<TABLE ID="ID_2010" style="display:none;" topmargin="0" leftmargin="0" width="100%" align="left" border="1" cellspacing="0" cellpadding="5" bgcolor="#FFFFFF">
										<xsl:copy-of select="TR"/>
										<tr style="font-family: arial, helvetica; font-size: 7pt; font-weight: normal; color: 000000; padding: 3px;">
											<td>Name Of Source GSD EventList</td>
											<td>
												<xsl:copy-of select="Data/GISTEventList/GISTEventListDescription/Name"/>
											</td>
										</tr>
										<tr bgcolor="#DDDAD7">
											<td colspan="2" align="left" style="font-family: arial, helvetica; font-size: 8pt; font-weight: normal; color: 000000; padding: 3px;">
												<B>GSD Eventlist &nbsp;  (<a href="javascript:ShowDriftCompensationDetails()">Hide</a>) </B>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<xsl:apply-templates select="Data"/>
											</td>
										</tr>
									</TABLE>
								</TD>
							</TR>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</TABLE>
		</xsl:if>

    <xsl:variable name="climateControlsAvailable">
      <xsl:value-of select="ATLConfocalSettingDefinition/ClimateControl/@ClimateControlCurrentlyInUse"/>
    </xsl:variable>
    <xsl:if test="$climateControlsAvailable = '1'">

      <TABLE width="98%" align="center" border="0" cellspacing="5" cellpadding="5">
        <TR>
          <TD align="left" style="font-family: arial, helvetica; font-size: 8pt; font-weight: normal; color: 000000; padding: 3px;">
            <b>Environmental Settings</b>
          </TD>
        </TR>
      </TABLE>

      <TABLE width="98%" align="center" border="0" cellspacing="0" cellpadding="5" bgcolor="#DDDAD7">
        <TR style="font-family: arial, helvetica; font-size: 8pt; font-weight: normal; padding: 3px;">
          <TD colspan="2">
            <TABLE topmargin="0" leftmargin="0" width="100%" align="center" border="1" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">
              <TR style="font-family: arial, helvetica; font-size: 8pt; font-weight: normal; padding: 3px;">
                <TD width="20%">
                  <b>Unit Name </b>
                </TD>
                <TD width="10%">
                  <b>Enabled </b>
                </TD>
                <TD width="12%">
                  <b>Setpoint </b>
                </TD>
                <TD width="12%">
                  <b>Actual Value </b>
                </TD>
                <TD width="10%">
                  <b>Range Control </b>
                </TD>
                <TD width="12%">
                  <b>Minimum Range </b>
                </TD>
                <TD width="12%">
                  <b>Maximum Range </b>
                </TD>
                <TD width="12%">
                  <b>Stop On Alert </b>
                </TD>
              </TR>
              <xsl:for-each select="ATLConfocalSettingDefinition/ClimateControl/ClimateUnit">
                <xsl:variable name="MyCounter" select="position()-1"/>
                <xsl:variable name="SetpointVal" select="concat(@SetpointValue, '.0')"/>
                <xsl:variable name="SetpointValPointNull" select="@SetpointValue"/>

                <TR style="font-family: arial, helvetica; font-size: 8pt; font-weight: normal; padding: 3px;">
                  <TD>
                    <xsl:value-of select="@Name"/>
                  </TD>
                  <TD>
                    <xsl:if test="@Enabled != '0'">
                      ON
                    </xsl:if>
                    <xsl:if test="@Enabled = '0'">
                      OFF
                    </xsl:if>
                  </TD>
                  <TD>
                    <xsl:if test="@SetpointValue*10 mod 10 != 0">
                      <xsl:value-of select="@SetpointValue"/>
                    </xsl:if>
                    <xsl:if test="@SetpointValue*10 mod 10 = 0">
                      <xsl:value-of select="concat(@SetpointValue, '.0')"/>
                    </xsl:if>
                    <xsl:value-of select="@DimensionUnit"/>
                  </TD>
                  <TD>
                    <xsl:if test="@ActualValue*10 mod 10 != 0">
                      <xsl:value-of select="@ActualValue"/>
                    </xsl:if>
                    <xsl:if test="@ActualValue*10 mod 10 = 0">
                      <xsl:value-of select="concat(@ActualValue, '.0')"/>
                    </xsl:if>
                    <xsl:value-of select="@DimensionUnit"/>
                  </TD>
                  <TD>
                    <xsl:if test="@RangeControlEnabled != '0'">
                      ON
                    </xsl:if>
                    <xsl:if test="@RangeControlEnabled = '0'">
                      OFF
                    </xsl:if>
                  </TD>
                  <xsl:if test="@RangeControlEnabled != '0'">
                    <TD>
                      <xsl:if test="@RangeMinimumValue*10 mod 10 != 0">
                        <xsl:value-of select="@RangeMinimumValue"/>
                      </xsl:if>
                      <xsl:if test="@RangeMinimumValue*10 mod 10 = 0">
                        <xsl:value-of select="concat(@RangeMinimumValue, '.0')"/>
                      </xsl:if>
                      <xsl:value-of select="@DimensionUnit"/>
                    </TD>
                    <TD>
                      <xsl:if test="@RangeMaximumValue*10 mod 10 != 0">
                        <xsl:value-of select="@RangeMaximumValue"/>
                      </xsl:if>
                      <xsl:if test="@RangeMaximumValue*10 mod 10 = 0">
                        <xsl:value-of select="concat(@RangeMaximumValue, '.0')"/>
                      </xsl:if>
                      <xsl:value-of select="@DimensionUnit"/>
                    </TD>
                    <TD>
                      <xsl:if test="@RangeControlStopExperimentOnAlert != '0'">
                        ON
                      </xsl:if>
                      <xsl:if test="@RangeControlStopExperimentOnAlert = '0'">
                        OFF
                      </xsl:if>
                    </TD>
                  </xsl:if>
                  <xsl:if test="@RangeControlEnabled = '0'">
                    <TD>
                      -
                    </TD>
                    <TD>
                      -
                    </TD>
                    <TD>
                      -
                    </TD>
                  </xsl:if>
                </TR>
              </xsl:for-each>
            </TABLE>
          </TD>
        </TR>
      </TABLE>
    </xsl:if>
    
	</xsl:template>
</xsl:stylesheet>
