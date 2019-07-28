<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:math="http://exslt.org/math" exclude-result-prefixes="math" version="2.0">
  <xsl:output method="xml" indent="yes"/>
  <xsl:template match="/">
    <macros>
      <xsl:for-each select="/*/levels/level">
        <xsl:variable name="level" select="./text()"/>
        <xsl:for-each select="/*/technology">
          <xsl:if test="$level &gt;= ./@level_min and $level &lt;= ./@level_max">
            <macro class="turret">
              <xsl:attribute name="name">
                <xsl:text>ut_tech_gen_turret_</xsl:text>
                <xsl:value-of select="./@faction"/>
                <xsl:text>_</xsl:text>
                <xsl:value-of select="./@size"/>
                <xsl:text>_</xsl:text>
                <xsl:value-of select="./@type"/>
                <xsl:text>_T</xsl:text>
                <xsl:number value="$level" format="001"/>
                <xsl:text>_macro</xsl:text>
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
                  <xsl:value-of select="./base_stats/turret/component/@ref"/>
                </xsl:attribute>
              </component>
              <properties>
                <identification unique="0" name="{./base_stats/turret/properties/identification/@name}" basename="{./base_stats/turret/properties/identification/@basename}" shortname="{./base_stats/turret/properties/identification/@shortname}" makerrace="{./base_stats/turret/properties/identification/@makerrace}" description="{./base_stats/turret/properties/identification/@description}"/>
                <bullet>
                  <xsl:attribute name="class">
                    <xsl:text>ut_tech_gen_turret_bullet_</xsl:text>
                    <xsl:value-of select="./@faction"/>
                    <xsl:text>_</xsl:text>
                    <xsl:value-of select="./@size"/>
                    <xsl:text>_</xsl:text>
                    <xsl:value-of select="./@type"/>
                    <xsl:text>_T</xsl:text>
                    <xsl:number value="$level" format="001"/>
                    <xsl:value-of select="$level"/>
                    <xsl:text>_macro</xsl:text>
                  </xsl:attribute>
                </bullet>
                <rotationspeed>
                  <xsl:attribute name="max">
                    <xsl:choose>
                      <xsl:when test="./progression/turret/properties/rotationspeed[@max]">
                        <xsl:value-of select="./base_stats/turret/properties/rotationspeed/@max * math:power(./progression/turret/properties/rotationspeed/@max, $level - ./@level_min) "/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="./base_stats/turret/properties/rotationspeed/@max"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:attribute>
                </rotationspeed>
                <reload>
                  <xsl:attribute name="rate">
                    <xsl:choose>
                      <xsl:when test="./progression/turret/properties/reload[@rate]">
                        <xsl:value-of select="./base_stats/turret/properties/reload/@rate * math:power(./progression/turret/properties/reload/@rate, $level - ./@level_min) "/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="./base_stats/turret/properties/reload/@rate"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:attribute>
                  <xsl:attribute name="time">
                    <xsl:choose>
                      <xsl:when test="./progression/turret/properties/reload[@time]">
                        <xsl:value-of select="./base_stats/turret/properties/reload/@rate * math:power(./progression/turret/properties/reload/@time, $level - ./@level_min) "/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="./base_stats/turret/properties/reload/@time"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:attribute>
                </reload>
                <hull>
                  <xsl:if test="./base_stats/turret/properties/hull[@integrated]">
                    <xsl:attribute name="integrated">
                      <xsl:value-of select="./base_stats/turret/properties/hull/@integrated"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:attribute name="threshold">
                    <xsl:choose>
                      <xsl:when test="./progression/turret/properties/hull[@threshold]">
                        <xsl:value-of select="./base_stats/turret/properties/hull/@threshold * math:power(./progression/turret/properties/hull/@threshold, $level - ./@level_min) "/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="./base_stats/turret/properties/hull/@threshold"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:attribute>
                </hull>
              </properties>
            </macro>
            <macro class="bullet">
              <xsl:attribute name="name">
                <xsl:text>ut_tech_gen_turret_bullet_</xsl:text>
                <xsl:value-of select="./@faction"/>
                <xsl:text>_</xsl:text>
                <xsl:value-of select="./@size"/>
                <xsl:text>_</xsl:text>
                <xsl:value-of select="./@type"/>
                <xsl:text>_T</xsl:text>
                <xsl:number value="$level" format="001"/>
                <xsl:text>_macro</xsl:text>
              </xsl:attribute>
              <component>
                <xsl:attribute name="ref">
                  <xsl:value-of select="./base_stats/bullet/component/@ref"/>
                </xsl:attribute>
              </component>
              <properties>
                <ammunition>
                  <xsl:attribute name="value">
                    <xsl:choose>
                      <xsl:when test="./progression/bullet/properties/ammunition[@value]">
                        <xsl:value-of select="./base_stats/bullet/properties/ammunition/@value * math:power(./progression/bullet/properties/ammunition/@value, $level - ./@level_min) "/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="./base_stats/bullet/properties/ammunition/@value"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:attribute>
                  <xsl:if test="./progression/bullet/properties/ammunition[@reload]">
                    <xsl:attribute name="reload">
                      <xsl:value-of select="./progression/bullet/properties/ammunition@reload"/>
                    </xsl:attribute>
                  </xsl:if>
                </ammunition>
                <bullet>
                  <xsl:attribute name="speed">
                    <xsl:choose>
                      <xsl:when test="./progression/bullet/properties/bullet[@speed]">
                        <xsl:value-of select="./base_stats/bullet/properties/bullet/@speed * math:power(./progression/bullet/properties/bullet/@speed, $level - ./@level_min) "/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="./base_stats/bullet/properties/bullet/@speed"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:attribute>
                  <xsl:attribute name="lifetime">
                    <xsl:choose>
                      <xsl:when test="./progression/bullet/properties/bullet[@lifetime]">
                        <xsl:value-of select="./base_stats/bullet/properties/bullet/@lifetime * math:power(./progression/bullet/properties/bullet/@lifetime, $level - ./@level_min) "/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="./base_stats/bullet/properties/bullet/@lifetime"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:attribute>
                  <xsl:attribute name="amount">
                    <xsl:value-of select="./base_stats/bullet/properties/bullet/@amount"/>
                  </xsl:attribute>
                  <xsl:attribute name="barrelamount">
                    <xsl:value-of select="./base_stats/bullet/properties/bullet/@barrelamount"/>
                  </xsl:attribute>
                  <xsl:attribute name="icon">
                    <xsl:value-of select="./base_stats/bullet/properties/bullet/@icon"/>
                  </xsl:attribute>
                  <xsl:attribute name="timediff">
                    <xsl:value-of select="./base_stats/bullet/properties/bullet/@timediff"/>
                  </xsl:attribute>
                  <xsl:attribute name="angle">
                    <xsl:choose>
                      <xsl:when test="./progression/bullet/properties/bullet[@angle]">
                        <xsl:value-of select="./base_stats/bullet/properties/bullet/@angle * math:power(./progression/bullet/properties/bullet/@angle, $level - ./@level_min) "/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="./base_stats/bullet/properties/bullet/@angle"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:attribute>
                  <xsl:attribute name="maxhits">
                    <xsl:choose>
                      <xsl:when test="./progression/bullet/properties/bullet[@maxhits]">
                        <xsl:value-of select="./base_stats/bullet/properties/bullet/@maxhits * math:power(./progression/bullet/properties/bullet/@maxhits, $level - ./@level_min) "/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="./base_stats/bullet/properties/bullet/@maxhits"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:attribute>
                  <xsl:attribute name="ricochet">
                    <xsl:choose>
                      <xsl:when test="./progression/bullet/properties/bullet[@ricochet]">
                        <xsl:value-of select="./base_stats/bullet/properties/bullet/@ricochet * math:power(./progression/bullet/properties/bullet/@ricochet, $level - ./@level_min) "/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="./base_stats/bullet/properties/bullet/@ricochet"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:attribute>
                  <xsl:attribute name="restitution">
                    <xsl:choose>
                      <xsl:when test="./progression/bullet/properties/bullet[@restitution]">
                        <xsl:value-of select="./base_stats/bullet/properties/bullet/@restitution * math:power(./progression/bullet/properties/bullet/@restitution, $level - ./@level_min) "/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="./base_stats/bullet/properties/bullet/@restitution"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:attribute>
                  <xsl:attribute name="scale">
                    <xsl:value-of select="./base_stats/bullet/properties/bullet/@scale"/>
                  </xsl:attribute>
                  <xsl:attribute name="attach">
                    <xsl:value-of select="./base_stats/bullet/properties/bullet/@attach"/>
                  </xsl:attribute>
                </bullet>
                <heat>
                  <xsl:attribute name="value">
                    <xsl:choose>
                      <xsl:when test="./progression/bullet/properties/heat[@value]">
                        <xsl:value-of select="./base_stats/bullet/properties/heat/@value * math:power(./progression/bullet/properties/heat/@value, $level - ./@level_min) "/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="./base_stats/bullet/properties/heat/@value"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:attribute>
                </heat>
                <reload>
                  <xsl:attribute name="rate">
                    <xsl:choose>
                      <xsl:when test="./progression/bullet/properties/reload[@rate]">
                        <xsl:value-of select="./base_stats/bullet/properties/reload/@rate * math:power(./progression/bullet/properties/reload/@rate, $level - ./@level_min) "/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="./base_stats/bullet/properties/reload/@rate"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:attribute>
                </reload>
                <damage>
                  <xsl:if test="./base_stats/bullet/properties/damage[@value]">
                    <xsl:attribute name="value">
                      <xsl:choose>
                        <xsl:when test="./progression/bullet/properties/damage[@value]">
                          <xsl:value-of select="./base_stats/bullet/properties/damage/@value * math:power(./progression/bullet/properties/damage/@value, $level - ./@level_min) "/>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:value-of select="./base_stats/bullet/properties/damage/@value"/>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:if test="./base_stats/bullet/properties/damage[@hull]">
                    <xsl:attribute name="hull">
                      <xsl:choose>
                        <xsl:when test="./progression/bullet/properties/damage[@hull]">
                          <xsl:value-of select="./base_stats/bullet/properties/damage/@hull * math:power(./progression/bullet/properties/damage/@hull, $level - ./@level_min) "/>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:value-of select="./base_stats/bullet/properties/damage/@hull"/>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:if test="./base_stats/bullet/properties/damage[@shield]">
                    <xsl:attribute name="shield">
                      <xsl:choose>
                        <xsl:when test="./progression/bullet/properties/damage[@shield]">
                          <xsl:value-of select="./base_stats/bullet/properties/damage/@shield * math:power(./progression/bullet/properties/damage/@shield, $level - ./@level_min) "/>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:value-of select="./base_stats/bullet/properties/damage/@shield"/>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:if test="./base_stats/bullet/properties/damage[@repair]">
                    <xsl:attribute name="repair">
                      <xsl:value-of select="./base_stats/bullet/properties/damage/@repair"/>
                    </xsl:attribute>
                  </xsl:if>
                </damage>
                <effects>
                  <impact ref="{./base_stats/bullet/properties/effects/impact/@ref}"/>
                  <launch ref="{./base_stats/bullet/properties/effects/launch/@ref}"/>
                </effects>
                <weapon system="{./base_stats/bullet/properties/weapon/@system}"/>
              </properties>
            </macro>
          </xsl:if>
        </xsl:for-each>
      </xsl:for-each>
    </macros>
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
