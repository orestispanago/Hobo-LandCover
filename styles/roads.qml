<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis simplifyAlgorithm="0" readOnly="0" simplifyDrawingTol="1" maxScale="0" minScale="1e+08" labelsEnabled="0" hasScaleBasedVisibilityFlag="0" simplifyMaxScale="1" styleCategories="AllStyleCategories" version="3.6.2-Noosa" simplifyDrawingHints="1" simplifyLocal="1">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 type="singleSymbol" symbollevels="0" forceraster="0" enableorderby="0">
    <symbols>
      <symbol type="fill" alpha="0.35" force_rhr="0" name="0" clip_to_extent="1">
        <layer class="SimpleFill" locked="0" pass="0" enabled="1">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="0,0,0,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0,0,0,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0" k="outline_width"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="no" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
    <rotation/>
    <sizescale/>
  </renderer-v2>
  <customproperties>
    <property value="0" key="embeddedWidgets/count"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer diagramType="Histogram" attributeLegend="1">
    <DiagramCategory maxScaleDenominator="1e+08" penAlpha="255" opacity="1" minScaleDenominator="0" labelPlacementMethod="XHeight" lineSizeScale="3x:0,0,0,0,0,0" backgroundAlpha="255" penColor="#000000" rotationOffset="270" height="15" diagramOrientation="Up" enabled="0" backgroundColor="#ffffff" width="15" sizeType="MM" penWidth="0" sizeScale="3x:0,0,0,0,0,0" scaleDependency="Area" minimumSize="0" scaleBasedVisibility="0" lineSizeType="MM" barWidth="5">
      <fontProperties style="" description="MS Shell Dlg 2,6.6,-1,5,50,0,0,0,0,0"/>
      <attribute label="" color="#000000" field=""/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings placement="1" priority="0" zIndex="0" linePlacementFlags="18" dist="0" obstacle="0" showAll="1">
    <properties>
      <Option type="Map">
        <Option type="QString" value="" name="name"/>
        <Option name="properties"/>
        <Option type="QString" value="collection" name="type"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions removeDuplicateNodes="0" geometryPrecision="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <fieldConfiguration>
    <field name="COUNTRY">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="CITIES">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="FUA_OR_CIT">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="CODE2012">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="ITEM2012">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="PROD_DATE">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="IDENT">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Shape_Leng">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Shape_Area">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Pop2012">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias name="" index="0" field="COUNTRY"/>
    <alias name="" index="1" field="CITIES"/>
    <alias name="" index="2" field="FUA_OR_CIT"/>
    <alias name="" index="3" field="CODE2012"/>
    <alias name="" index="4" field="ITEM2012"/>
    <alias name="" index="5" field="PROD_DATE"/>
    <alias name="" index="6" field="IDENT"/>
    <alias name="" index="7" field="Shape_Leng"/>
    <alias name="" index="8" field="Shape_Area"/>
    <alias name="" index="9" field="Pop2012"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default expression="" field="COUNTRY" applyOnUpdate="0"/>
    <default expression="" field="CITIES" applyOnUpdate="0"/>
    <default expression="" field="FUA_OR_CIT" applyOnUpdate="0"/>
    <default expression="" field="CODE2012" applyOnUpdate="0"/>
    <default expression="" field="ITEM2012" applyOnUpdate="0"/>
    <default expression="" field="PROD_DATE" applyOnUpdate="0"/>
    <default expression="" field="IDENT" applyOnUpdate="0"/>
    <default expression="" field="Shape_Leng" applyOnUpdate="0"/>
    <default expression="" field="Shape_Area" applyOnUpdate="0"/>
    <default expression="" field="Pop2012" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" field="COUNTRY" exp_strength="0"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" field="CITIES" exp_strength="0"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" field="FUA_OR_CIT" exp_strength="0"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" field="CODE2012" exp_strength="0"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" field="ITEM2012" exp_strength="0"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" field="PROD_DATE" exp_strength="0"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" field="IDENT" exp_strength="0"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" field="Shape_Leng" exp_strength="0"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" field="Shape_Area" exp_strength="0"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" field="Pop2012" exp_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" desc="" field="COUNTRY"/>
    <constraint exp="" desc="" field="CITIES"/>
    <constraint exp="" desc="" field="FUA_OR_CIT"/>
    <constraint exp="" desc="" field="CODE2012"/>
    <constraint exp="" desc="" field="ITEM2012"/>
    <constraint exp="" desc="" field="PROD_DATE"/>
    <constraint exp="" desc="" field="IDENT"/>
    <constraint exp="" desc="" field="Shape_Leng"/>
    <constraint exp="" desc="" field="Shape_Area"/>
    <constraint exp="" desc="" field="Pop2012"/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
  </attributeactions>
  <attributetableconfig sortExpression="" actionWidgetStyle="dropDown" sortOrder="0">
    <columns>
      <column type="field" name="COUNTRY" width="-1" hidden="0"/>
      <column type="field" name="CITIES" width="-1" hidden="0"/>
      <column type="field" name="FUA_OR_CIT" width="-1" hidden="0"/>
      <column type="field" name="CODE2012" width="-1" hidden="0"/>
      <column type="field" name="ITEM2012" width="-1" hidden="0"/>
      <column type="field" name="PROD_DATE" width="-1" hidden="0"/>
      <column type="field" name="IDENT" width="-1" hidden="0"/>
      <column type="field" name="Shape_Leng" width="-1" hidden="0"/>
      <column type="field" name="Shape_Area" width="-1" hidden="0"/>
      <column type="field" name="Pop2012" width="-1" hidden="0"/>
      <column type="actions" width="-1" hidden="1"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <editform tolerant="1"></editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath></editforminitfilepath>
  <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
QGIS forms can have a Python function that is called when the form is
opened.

Use this function to add extra logic to your forms.

Enter the name of the function in the "Python Init function"
field.
An example follows:
"""
from qgis.PyQt.QtWidgets import QWidget

def my_form_open(dialog, layer, feature):
	geom = feature.geometry()
	control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>generatedlayout</editorlayout>
  <editable>
    <field name="CITIES" editable="1"/>
    <field name="CODE2012" editable="1"/>
    <field name="COUNTRY" editable="1"/>
    <field name="FUA_OR_CIT" editable="1"/>
    <field name="IDENT" editable="1"/>
    <field name="ITEM2012" editable="1"/>
    <field name="PROD_DATE" editable="1"/>
    <field name="Pop2012" editable="1"/>
    <field name="Shape_Area" editable="1"/>
    <field name="Shape_Leng" editable="1"/>
  </editable>
  <labelOnTop>
    <field name="CITIES" labelOnTop="0"/>
    <field name="CODE2012" labelOnTop="0"/>
    <field name="COUNTRY" labelOnTop="0"/>
    <field name="FUA_OR_CIT" labelOnTop="0"/>
    <field name="IDENT" labelOnTop="0"/>
    <field name="ITEM2012" labelOnTop="0"/>
    <field name="PROD_DATE" labelOnTop="0"/>
    <field name="Pop2012" labelOnTop="0"/>
    <field name="Shape_Area" labelOnTop="0"/>
    <field name="Shape_Leng" labelOnTop="0"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>IDENT</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>2</layerGeometryType>
</qgis>
