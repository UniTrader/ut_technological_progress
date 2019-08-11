﻿<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:math="http://exslt.org/math" xmlns:saxon="http://saxon.sf.net/" version="2.0" exclude-result-prefixes="math saxon">
  <xsl:output method="xml" indent="yes"/>
  <xsl:template match="/">
    <xsl:comment>Do not Edit this File directly - it is generated from files in the template directory, which you should edit and then run generate.sh to Update.</xsl:comment>
    <index>
      <xsl:for-each select="/index/entry">
        <xsl:copy-of select="."/>
      </xsl:for-each>
      <xsl:for-each select="/*/levels/level">
        <xsl:variable name="level" select="number(./text())"/>
        <xsl:for-each select="/*/technology">
          <xsl:if test="$level &gt;= ./@level_min and $level &lt;= ./@level_max">
            <xsl:variable name="macroname">
              <xsl:text>ut_tech_gen_</xsl:text>
              <xsl:value-of select="./@class"/>
              <xsl:text>_</xsl:text>
              <xsl:value-of select="./@faction"/>
              <xsl:text>_</xsl:text>
              <xsl:value-of select="./@size"/>
              <xsl:text>_</xsl:text>
              <xsl:value-of select="./@type"/>
              <xsl:text>_T</xsl:text>
              <xsl:number value="$level" format="001"/>
              <xsl:text>_macro</xsl:text>
            </xsl:variable>
            <entry>
              <xsl:attribute name="name">
                <xsl:value-of select="$macroname"/>
              </xsl:attribute>
              <xsl:attribute name="value">
                <xsl:text>extensions\ut_technological_progress\assets\generated\</xsl:text>
                <xsl:value-of select="$macroname"/>
              </xsl:attribute>
            </entry>
            <xsl:result-document method="xml" href="{$macroname}.xml" indent="yes">
              <xsl:comment>Do not Edit this File directly - it is generated from files in the template directory, which you should edit and then run generate.sh to Update.</xsl:comment>
              <macros>
                <macro class="{./@class}">
                  <xsl:attribute name="name">
                    <xsl:value-of select="$macroname"/>
                  </xsl:attribute>
                  <xsl:if test="$level != 1">
                    <xsl:attribute name="alias">
                      <xsl:text>ut_tech_gen_turret_</xsl:text>
                      <xsl:value-of select="./@faction"/>
                      <xsl:text>_</xsl:text>
                      <xsl:value-of select="./@size"/>
                      <xsl:text>_</xsl:text>
                      <xsl:value-of select="./@type"/>
                      <xsl:text>_T</xsl:text>
                      <xsl:text>001</xsl:text>
                      <xsl:text>_macro</xsl:text>
                    </xsl:attribute>
                  </xsl:if>
                  <component>
                    <xsl:attribute name="ref">
                      <xsl:value-of select="./component/@ref"/>
                    </xsl:attribute>
                  </component>
                  <properties>
                    <xsl:for-each select="./properties/*">
                      <xsl:choose>
                        <xsl:when test="name() = 'effects'">
                          <xsl:copy-of select="."/>
                        </xsl:when>
                        <xsl:when test="name() = 'bullet' and ../../../@class != 'bullet'">
                          <bullet>
                            <xsl:attribute name="class">
                              <xsl:text>ut_tech_gen_bullet_</xsl:text>
                              <xsl:value-of select="../../@faction"/>
                              <xsl:text>_</xsl:text>
                              <xsl:value-of select="../../@size"/>
                              <xsl:text>_</xsl:text>
                              <xsl:value-of select="../../@type"/>
                              <xsl:text>_T</xsl:text>
                              <xsl:number value="$level" format="001"/>
                              <xsl:text>_macro</xsl:text>
                            </xsl:attribute>
                          </bullet>
                        </xsl:when>
                        <!-- Just for Debugging Purposes - Use Macro Name as Object Name -->
                        <!--xsl:when test="name() = 'identification'">
                          <xsl:copy>
                            <xsl:for-each select="@*">
                              <xsl:copy/>
                            </xsl:for-each>
                            <xsl:attribute name="name">
                              <xsl:value-of select="$macroname"/>
                            </xsl:attribute>
                          </xsl:copy>
                        </xsl:when-->
                        <xsl:otherwise>
                          <xsl:copy>
                            <xsl:for-each select="@*">
                              <xsl:copy/>
                            </xsl:for-each>
                            <xsl:for-each select="./progression/@*">
                              <xsl:attribute name="{name()}">
                                <xsl:choose>
                                  <!-- Expotential Progression (value is multiplied with progressin for every level) if Progression Value is a fractional number, otherwise Linear progression with each level (progress value is added per level )-->
                                  <xsl:when test="floor(.) != . ">
                                    <!--                                            base Value                                          -> Power of -> Progression multi  -> current level minus start level of definition (so you set the value at level_min) -->
                                    <xsl:value-of select="saxon:evaluate(concat ('../../@' , name())) * math:power(number(.), ( $level - ../../../../@level_min ) )"/>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <!--                                            base Value                                             -> progression bonus  -> current level minus start level of definition (so you set the value at level_min) -->
                                    <xsl:value-of select="number(saxon:evaluate(concat ('../../@' , name()))) + (number(.) * ( $level - ../../../../@level_min ) ) "/>
                                  </xsl:otherwise>
                                </xsl:choose>
                              </xsl:attribute>
                            </xsl:for-each>
                          </xsl:copy>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:for-each>
                  </properties>
                </macro>
              </macros>
            </xsl:result-document>
          </xsl:if>
        </xsl:for-each>
      </xsl:for-each>
    </index>
  </xsl:template>
</xsl:stylesheet>
<!--
<macros>
  <macro name="turret_arg_m_gatling_01_mk1_macro" class="turret" alias="turret_arg_m_gatling_02_mk1_macro">
    <component ref="turret_arg_m_gatling_01_mk1" />
    <properties>
      <identification name="{20105,4084}" basename="{20105,4081}" shortname="{20105,4085}" makerrace="argon" description="{20105,4082}" mk="1" />
      <bullet class="bullet_gen_turret_m_gatling_01_mk1_macro" />
      <rotationspeed max="180" />
      <reload rate="1" time="1" />
      <hull threshold="0.2" integrated="1" />
    </properties>
  </macro>
  <macro name="bullet_gen_m_gatling_01_mk1_macro" class="bullet">
    <component ref="bullet_gen_m_gatling_01_mk1" />
    <properties>
      <ammunition value="21" reload="1" />
      <bullet speed="1920" lifetime="2.5" amount="1" barrelamount="1" icon="weapon_gatling_mk1" timediff="0.025" angle="0.25" maxhits="2" ricochet="0.01" restitution="0.3" scale="0" attach="0" />
      <heat value="43" />
      <reload rate="14" />
      <damage value="23" repair="0" />
      <effects>
        <impact ref="impact_gen_m_gatling_01_mk1" />
        <launch ref="muzzle_gen_m_gatling_01_mk1" />
      </effects>
      <weapon system="weapon_standard" />
    </properties>
  </macro>
</macros>-->
