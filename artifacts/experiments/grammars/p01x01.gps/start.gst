<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<gxl xmlns="http://www.gupro.de/GXL/gxl-1.0.dtd">
    <graph id="p01x01_start" role="rule" edgeids="false" edgemode="directed">
        <node id="n0"/>
        <edge from="n0" to="n0">
            <attr name="label">
                <string>type:ProcessSnapshot</string>
            </attr>
        </edge>
        <node id="n1"/>
        <edge from="n1" to="n1">
            <attr name="label">
                <string>string:"p01x01"</string>
            </attr>
        </edge>
        <node id="n2"/>
        <edge from="n2" to="n2">
            <attr name="label">
                <string>type:Running</string>
            </attr>
        </edge>
        <node id="n3"/>
        <edge from="n3" to="n3">
            <attr name="label">
                <string>type:Token</string>
            </attr>
        </edge>
        <node id="n4"/>
        <edge from="n4" to="n4">
            <attr name="label">
                <string>string:"FlowNode_1 -&gt; FlowNode_2 (sequenceFlow_801f2037-624f-4c6d-b912-58bb64834458)"</string>
            </attr>
        </edge>
        <edge from="n0" to="n1">
            <attr name="label">
                <string>name</string>
            </attr>
        </edge>
        <edge from="n0" to="n2">
            <attr name="label">
                <string>state</string>
            </attr>
        </edge>
        <edge from="n3" to="n4">
            <attr name="label">
                <string>position</string>
            </attr>
        </edge>
        <edge from="n0" to="n3">
            <attr name="label">
                <string>tokens</string>
            </attr>
        </edge>
    </graph>
</gxl>
