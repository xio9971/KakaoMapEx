//
//  ViewController.swift
//  KakaoMapEx
//
//  Created by 민트팟 on 2021/06/28.
//

import UIKit

import Then
import SnapKit

class ViewController: UIViewController {
    

    @IBOutlet var mainView: UIView!
    
    let mapView = MTMapView().then {
        $0.setMapCenter(.init(geoCoord: .init(latitude: 37.537229, longitude: 127.005515)), animated: true)
    }

    let po1 = MTMapPOIItem().then{
        $0.markerType = .redPin
        $0.mapPoint = .init(geoCoord: .init(latitude: 37.517229, longitude: 127.005525))
        $0.showAnimationType = .noAnimation
        $0.tag = 1
        $0.customImageName = "map_pin"
    }
    
    let po2 = MTMapPOIItem().then{
        $0.markerType = .redPin
        $0.mapPoint = .init(geoCoord: .init(latitude: 37.537229, longitude: 127.005525))
        $0.showAnimationType = .noAnimation
        $0.tag = 2
    }

    let po3 = MTMapPOIItem().then{
        $0.markerType = .redPin
        $0.mapPoint = .init(geoCoord: .init(latitude: 37.537229, longitude: 127.025525))
        $0.showAnimationType = .noAnimation
        $0.tag = 3
    }

    let po4 = MTMapPOIItem().then{
        $0.markerType = .redPin
        $0.mapPoint = .init(geoCoord: .init(latitude: 37.537229, longitude: 127.105525))
        $0.showAnimationType = .noAnimation
        $0.tag = 4
    }

    let po5 = MTMapPOIItem().then{
        $0.markerType = .redPin
        $0.mapPoint = .init(geoCoord: .init(latitude: 37.437210, longitude: 127.005525))
        $0.showAnimationType = .noAnimation
        $0.tag = 5
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.addSubview(mapView)
                
        mapView.delegate = self
        mapView.baseMapType = .standard
        mapView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        
        mapView.addPOIItems([po1, po2, po3, po4, po5])
        mapView.fitAreaToShowAllPOIItems()
        
    }
    
    func mapView(_ mapView: MTMapView!, updateCurrentLocation location: MTMapPoint!, withAccuracy accuracy: MTMapLocationAccuracy) {
        
        let currentLocationPointGeo = location.mapPointGeo
        print(currentLocationPointGeo().latitude)
        print(currentLocationPointGeo().longitude)
    }
    
    @IBAction func updateTrackingMode(_ sender: Any) {
        // onWithHeading : 트래킹모드on, 나침반모드 on
        // .off : 트래킹모드off, 나침반모드 off
        //mapView.showsLargeContentViewer = mapView.currentLocationTrackingMode.rawValue == 0 ? true : false
        mapView.currentLocationTrackingMode = mapView.currentLocationTrackingMode.rawValue == 0 ? .onWithHeading : .off
    }

}

extension ViewController: MTMapViewDelegate {
    
}

