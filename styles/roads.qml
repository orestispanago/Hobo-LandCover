<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis simplifyLocal="1" hasScaleBasedVisibilityFlag="0" maxScale="0" labelsEnabled="0" simplifyDrawingTol="1" version="3.6.2-Noosa" minScale="1e+08" simplifyAlgorithm="0" simplifyDrawingHints="1" styleCategories="AllStyleCategories" simplifyMaxScale="1" readOnly="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 forceraster="0" symbollevels="0" enableorderby="0" type="singleSymbol">
    <symbols>
      <symbol clip_to_extent="1" type="fill" name="0" alpha="0.205" force_rhr="0">
        <layer locked="0" class="SimpleFill" enabled="1" pass="0">
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
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
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
    <DiagramCategory width="15" barWidth="5" sizeType="MM" minimumSize="0" sizeScale="3x:0,0,0,0,0,0" lineSizeType="MM" penColor="#000000" lineSizeScale="3x:0,0,0,0,0,0" scaleBasedVisibility="0" scaleDependency="Area" opacity="1" backgroundColor="#ffffff" maxScaleDenominator="1e+08" diagramOrientation="Up" labelPlacementMethod="XHeight" penAlpha="255" minScaleDenominator="0" backgroundAlpha="255" rotationOffset="270" penWidth="0" enabled="0" height="15">
      <fontProperties description="MS Shell Dlg 2,6.6,-1,5,50,0,0,0,0,0" style=""/>
      <attribute field="" color="#000000" label=""/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings placement="1" zIndex="0" showAll="1" dist="0" priority="0" linePlacementFlags="18" obstacle="0">
    <properties>
      <Option type="Map">
        <Option value="" type="QString" name="name"/>
        <Option name="properties"/>
        <Option value="collection" type="QString" name="type"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions geometryPrecision="0" removeDuplicateNodes="0">
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
    <alias index="0" name="" field="COUNTRY"/>
    <alias index="1" name="" field="CITIES"/>
    <alias index="2" name="" field="FUA_OR_CIT"/>
    <alias index="3" name="" field="CODE2012"/>
    <alias index="4" name="" field="ITEM2012"/>
    <alias index="5" name="" field="PROD_DATE"/>
    <alias index="6" name="" field="IDENT"/>
    <alias index="7" name="" field="Shape_Leng"/>
    <alias index="8" name="" field="Shape_Area"/>
    <alias index="9" name="" field="Pop2012"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default field="COUNTRY" expression="" applyOnUpdate="0"/>
    <default field="CITIES" expression="" applyOnUpdate="0"/>
    <default field="FUA_OR_CIT" expression="" applyOnUpdate="0"/>
    <default field="CODE2012" expression="" applyOnUpdate="0"/>
    <default field="ITEM2012" expression="" applyOnUpdate="0"/>
    <default field="PROD_DATE" expression="" applyOnUpdate="0"/>
    <default field="IDENT" expression="" applyOnUpdate="0"/>
    <default field="Shape_Leng" expression="" applyOnUpdate="0"/>
    <default field="Shape_Area" expression="" applyOnUpdate="0"/>
    <default field="Pop2012" expression="" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint notnull_strength="0" exp_strength="0" field="COUNTRY" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="CITIES" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="FUA_OR_CIT" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="CODE2012" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="ITEM2012" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="PROD_DATE" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="IDENT" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="Shape_Leng" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="Shape_Area" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="Pop2012" constraints="0" unique_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" field="COUNTRY" desc=""/>
    <constraint exp="" field="CITIES" desc=""/>
    <constraint exp="" field="FUA_OR_CIT" desc=""/>
    <constraint exp="" field="CODE2012" desc=""/>
    <constraint exp="" field="ITEM2012" desc=""/>
    <constraint exp="" field="PROD_DATE" desc=""/>
    <constraint exp="" field="IDENT" desc=""/>
    <constraint exp="" field="Shape_Leng" desc=""/>
    <constraint exp="" field="Shape_Area" desc=""/>
    <constraint exp="" field="Pop2012" desc=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
  </attributeactions>
  <attributetableconfig sortExpression="" actionWidgetStyle="dropDown" sortOrder="0">
    <columns>
      <column type="field" name="COUNTRY" hidden="0" width="-1"/>
      <column type="field" name="CITIES" hidden="0" width="-1"/>
      <column type="field" name="FUA_OR_CIT" hidden="0" width="-1"/>
      <column type="field" name="CODE2012" hidden="0" width="-1"/>
      <column type="field" name="ITEM2012" hidden="0" width="-1"/>
      <column type="field" name="PROD_DATE" hidden="0" width="-1"/>
      <column type="field" name="IDENT" hidden="0" width="-1"/>
      <column type="field" name="Shape_Leng" hidden="0" width="-1"/>
      <column type="field" name="Shape_Area" hidden="0" width="-1"/>
      <column type="field" name="Pop2012" hidden="0" width="-1"/>
      <column type="actions" hidden="1" width="-1"/>
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
    <field editable="1" name="CITIES"/>
    <field editable="1" name="CODE2012"/>
    <field editable="1" name="COUNTRY"/>
    <field editable="1" name="FUA_OR_CIT"/>
    <field editable="1" name="IDENT"/>
    <field editable="1" name="ITEM2012"/>
    <field editable="1" name="PROD_DATE"/>
    <field editable="1" name="Pop2012"/>
    <field editable="1" name="Shape_Area"/>
    <field editable="1" name="Shape_Leng"/>
  </editable>
  <labelOnTop>
    <field labelOnTop="0" name="CITIES"/>
    <field labelOnTop="0" name="CODE2012"/>
    <field labelOnTop="0" name="COUNTRY"/>
    <field labelOnTop="0" name="FUA_OR_CIT"/>
    <field labelOnTop="0" name="IDENT"/>
    <field labelOnTop="0" name="ITEM2012"/>
    <field labelOnTop="0" name="PROD_DATE"/>
    <field labelOnTop="0" name="Pop2012"/>
    <field labelOnTop="0" name="Shape_Area"/>
    <field labelOnTop="0" name="Shape_Leng"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>IDENT</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>2</layerGeometryType>
</qgis>
