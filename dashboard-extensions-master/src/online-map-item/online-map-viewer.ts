
/// See the DevExtreme documentation to learn more about the Map UI widget settings.
/// https://js.devexpress.com/Documentation/16_2/ApiReference/UI_Widgets/dxMap/

import { CustomItemViewer } from 'devexpress-dashboard/common'
import dxMap from 'devextreme/ui/map'
import { dxElement } from 'devextreme/core/element';


export class OnlineMapItem extends CustomItemViewer {
    private mapViewer: any;

    constructor(model: any, container, options) {
        super(model, container, options);
        this.mapViewer = null;
    }

    setSize(width, height) {
        super.setSize(width, height);
        let contentWidth = this.contentWidth(),
            contentHeight = this.contentHeight();
        this.mapViewer.option('width', contentWidth);
        this.mapViewer.option('height', contentHeight);
    }
    setSelection(values: Array<Array<any>>) {
        super.setSelection(values);
        this._updateSelection();
    };
    clearSelection() {
        super.clearSelection();
        this._updateSelection();
    }

    renderContent(element: dxElement, changeExisting: boolean, afterRenderCallback?) {
        var markers = [],
            routes = [],
            mode = this.getPropertyValue('DisplayMode'),
            showMarkers = mode === 'Markers' || mode === 'MarkersAndRoutes' || this.canMasterFilter(),
            showRoutes = mode === 'Routes' || mode === 'MarkersAndRoutes';
        if(this.getBindingValue('Latitude').length > 0 && this.getBindingValue('Longitude').length > 0) {
            this.iterateData(row => {
                var latitude = row.getValue('Latitude')[0];
                var longitude = row.getValue('Longitude')[0];
                if (latitude && longitude) {
                    if (showMarkers) {
                        markers.push({
                            location: { lat: latitude, lng: longitude },
                            iconSrc: this.isSelected(row) ? "https://js.devexpress.com/Demos/RealtorApp/images/map-marker.png" : null,
                            onClick: args => { this._onClick(row); },
                            tag: row
                        });
                    }
                    if (showRoutes) {
                        routes.push([latitude, longitude]);
                    }
                }
            });
        }
        var autoAdjust = markers.length > 1 || routes.length > 1, 
            options = <any>{
                provider: this.getPropertyValue('Provider').toLowerCase(),
                type: this.getPropertyValue('Type').toLowerCase(),
                controls: true,
                zoom: autoAdjust ? 1000 : 1,
                autoAdjust: autoAdjust,
                width: this.contentWidth(),
                height: this.contentHeight(),
                // Use the template below to authenticate the application within the required map provider.
                //key: { 
                //    bing: 'BINGAPIKEY',
                //    google: 'GOOGLEAPIKEY'
                //},             
                markers: markers,
                routes: routes.length > 0 ? [{
                    weight: 6,
                    color: 'blue',
                    opacity: 0.5,
                    mode: '',
                    locations: routes
                }] : []
            };
        if(changeExisting && this.mapViewer) {
            this.mapViewer.option(options);
        } else {
            this.mapViewer = new (dxMap || (<any>window).DevExpress.ui.dxMap)(element, options);
        }
    }

    private _onClick(row) {
        this.setMasterFilter(row);
        this._updateSelection();
    }

    private _updateSelection() {
        var markers = this.mapViewer.option('markers');
        markers.forEach(marker => {
            marker.iconSrc = this.isSelected(marker.tag) ? "https://js.devexpress.com/Demos/RealtorApp/images/map-marker.png" : null;
        });
        this.mapViewer.option('autoAdjust', false);
        this.mapViewer.option('markers', markers);
    }
}