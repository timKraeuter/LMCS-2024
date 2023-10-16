<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<gxl xmlns="http://www.gupro.de/GXL/gxl-1.0.dtd">
    <graph id="e016_start" role="rule" edgeids="false" edgemode="directed">
        <node id="n0"/>
        <edge from="n0" to="n0">
            <attr name="label">
                <string>type:ProcessSnapshot</string>
            </attr>
        </edge>
        <node id="n1"/>
        <edge from="n1" to="n1">
            <attr name="label">
                <string>string:"Sender"</string>
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
                <string>string:"StartEvent_1 -&gt; ExclusiveGateway_1gus05a (SequenceFlow_1bot7ik)"</string>
            </attr>
        </edge>
        <node id="n5"/>
        <edge from="n5" to="n5">
            <attr name="label">
                <string>type:ProcessSnapshot</string>
            </attr>
        </edge>
        <node id="n6"/>
        <edge from="n6" to="n6">
            <attr name="label">
                <string>string:"Receiver"</string>
            </attr>
        </edge>
        <node id="n7"/>
        <edge from="n7" to="n7">
            <attr name="label">
                <string>type:Running</string>
            </attr>
        </edge>
        <node id="n8"/>
        <edge from="n8" to="n8">
            <attr name="label">
                <string>type:Token</string>
            </attr>
        </edge>
        <node id="n9"/>
        <edge from="n9" to="n9">
            <attr name="label">
                <string>string:"StartEvent_0x0o2ml -&gt; ExclusiveGateway_1aidani (SequenceFlow_0fxw5l8)"</string>
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
        <edge from="n5" to="n6">
            <attr name="label">
                <string>name</string>
            </attr>
        </edge>
        <edge from="n5" to="n7">
            <attr name="label">
                <string>state</string>
            </attr>
        </edge>
        <edge from="n8" to="n9">
            <attr name="label">
                <string>position</string>
            </attr>
        </edge>
        <edge from="n5" to="n8">
            <attr name="label">
                <string>tokens</string>
            </attr>
        </edge>
    </graph>
</gxl>
