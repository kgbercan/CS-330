//
//  PaceGuideModel.swift
//  PaceGuide
//
//  Created by Karina Bercan on 3/31/16.
//  Copyright © 2016 Karina Bercan. All rights reserved.
//

import Foundation

// pace look-up
class PaceGuideModel{
    
    ////// percentages \\\\\\
    // 500 time : goal \\
    let ninetyfive: [String:String] = ["2:10": "2:16.5",
                                       "2:09": "2:15.4",
                                       "2:08": "2:14.4",
                                       "2:07": "2:13.3",
                                       "2:06": "2:12.3",
                                       "2:05": "2:11.2",
                                       "2:04": "2:10.2",
                                       "2:03": "2:09.1",
                                       "2:02": "2:08.1",
                                       "2:01": "2:07.0",
                                       "2:00": "2:06.0",
                                       "1:59": "2:04.9",
                                       "1:58": "2:03.9",
                                       "1:57": "2:02.8",
                                       "1:56": "2:01.8",
                                       "1:55": "2:00.7",
                                       "1:54": "1:59.7",
                                       "1:53": "1:58.6",
                                       "1:52": "1:57.6",
                                       "1:51": "1:56.5",
                                       "1:50": "1:55.5",
                                       "1:49": "1:54.4",
                                       "1:48": "1:53.4",
                                       "1:47": "1:52.3",
                                       "1:46": "1:51.3",
                                       "1:45": "1:50.2",
                                       "1:44": "1:49.2",
                                       "1:43": "1:48.1",
                                       "1:42": "1:47.1",
                                       "1:41": "1:46.1",
                                       "1:40": "1:45.0",
                                       "1:39": "1:43.9",
                                       "1:38": "1:42.9",
                                       "1:37": "1:41.9",
                                       "1:36": "1:40.8",
                                       "1:35": "1:39.7",
                                       "1:34": "1:38.7",
                                       "1:33": "1:37.6",
                                       "1:32": "1:36.6",
                                       "1:31": "1:35.6",
                                       "1:30": "1:34.5",
                                       ]
    
    
    let ninety: [String:String] = ["2:10": "2:23.0",
                                   "2:09": "2:21.9",
                                   "2:08": "2:20.8",
                                   "2:07": "2:19.7",
                                   "2:06": "2:18.6",
                                   "2:05": "2:17.5",
                                   "2:04": "2:16.4",
                                   "2:03": "2:15.3",
                                   "2:02": "2:14.2",
                                   "2:01": "2:13.1",
                                   "2:00": "2:12.0",
                                   "1:59": "2:10.9",
                                   "1:58": "2:09.8",
                                   "1:57": "2:08.7",
                                   "1:56": "2:07.6",
                                   "1:55": "2:06.5",
                                   "1:54": "2:05.4",
                                   "1:53": "2:04.3",
                                   "1:52": "2:03.2",
                                   "1:51": "2:02.1",
                                   "1:50": "2:01.0",
                                   "1:49": "1:59.9",
                                   "1:48": "1:58.8",
                                   "1:47": "1:57.7",
                                   "1:46": "1:56.6",
                                   "1:45": "1:55.5",
                                   "1:44": "1:54.4",
                                   "1:43": "1:53.3",
                                   "1:42": "1:52.2",
                                   "1:41": "1:51.2",
                                   "1:40": "1:50.0",
                                   "1:39": "1:48.9",
                                   "1:38": "1:47.8",
                                   "1:37": "1:46.7",
                                   "1:36": "1:45.6",
                                   "1:35": "1:44.5",
                                   "1:34": "1:43.4",
                                   "1:33": "1:42.3",
                                   "1:32": "1:41.2",
                                   "1:31": "1:40.2",
                                   "1:30": "1:39.0"
    ]
    
    let eightyfive: [String:String] = ["2:10": "2:29.5",
                                       "2:09": "2:28.3",
                                       "2:08": "2:27.2",
                                       "2:07": "2:26.0",
                                       "2:06": "2:24.9",
                                       "2:05": "2:23.7",
                                       "2:04": "2:22.6",
                                       "2:03": "2:21.4",
                                       "2:02": "2:20.3",
                                       "2:01": "2:19.1",
                                       "2:00": "2:18.0",
                                       "1:59": "2:16.8",
                                       "1:58": "2:15.7",
                                       "1:57": "2:14.5",
                                       "1:56": "2:13.4",
                                       "1:55": "2:12.2",
                                       "1:54": "2:11.1",
                                       "1:53": "2:09.9",
                                       "1:52": "2:08.8",
                                       "1:51": "2:07.6",
                                       "1:50": "2:06.5",
                                       "1:49": "2:05.3",
                                       "1:48": "2:04.2",
                                       "1:47": "2:03.0",
                                       "1:46": "2:01.9",
                                       "1:45": "2:00.7",
                                       "1:44": "1:59.6",
                                       "1:43": "1:58.4",
                                       "1:42": "1:57.3",
                                       "1:41": "1:56.2",
                                       "1:40": "1:55.0",
                                       "1:39": "1:53.8",
                                       "1:38": "1:52.7",
                                       "1:37": "1:51.5",
                                       "1:36": "1:50.4",
                                       "1:35": "1:49.2",
                                       "1:34": "1:48.1",
                                       "1:33": "1:46.9",
                                       "1:32": "1:45.8",
                                       "1:31": "1:44.7",
                                       "1:30": "1:43.5"
    ]
    
    let eighty: [String:String] = ["2:10": "2:36.0",
                                   "2:09": "2:34.8",
                                   "2:08": "2:33.6",
                                   "2:07": "2:32.4",
                                   "2:06": "2:31.2",
                                   "2:05": "2:30.0",
                                   "2:04": "2:28.8",
                                   "2:03": "2:27.6",
                                   "2:02": "2:26.4",
                                   "2:01": "2:25.2",
                                   "2:00": "2:24.0",
                                   "1:59": "2:22.8",
                                   "1:58": "2:21.6",
                                   "1:57": "2:20.4",
                                   "1:56": "2:19.2",
                                   "1:55": "2:18.0",
                                   "1:54": "2:16.8",
                                   "1:53": "2:15.6",
                                   "1:52": "2:14.4",
                                   "1:51": "2:13.2",
                                   "1:50": "2:12.0",
                                   "1:49": "2:10.0",
                                   "1:48": "2:09.6",
                                   "1:47": "2:08.4",
                                   "1:46": "2:07.2",
                                   "1:45": "2:05.9",
                                   "1:44": "2:04.8",
                                   "1:43": "2:03.6",
                                   "1:42": "2:02.4",
                                   "1:41": "2:01.3",
                                   "1:40": "2:00.0",
                                   "1:39": "1:58.8",
                                   "1:38": "1:57.6",
                                   "1:37": "1:56.4",
                                   "1:36": "1:55.2",
                                   "1:35": "1:54.0",
                                   "1:34": "1:52.8",
                                   "1:33": "1:51.6",
                                   "1:32": "1:50.4",
                                   "1:31": "1:49.3",
                                   "1:30": "1:48.0"
    ]
    
    
    let seventyfive: [String:String] = ["2:10": "2:42.5",
                                        "2:09": "2:41.2",
                                        "2:08": "2:40.0",
                                        "2:07": "2:38.7",
                                        "2:06": "2:37.5",
                                        "2:05": "2:36.2",
                                        "2:04": "2:35.0",
                                        "2:03": "2:33.7",
                                        "2:02": "2:32.5",
                                        "2:01": "2:31.2",
                                        "2:00": "2:30.0",
                                        "1:59": "2:28.7",
                                        "1:58": "2:27.5",
                                        "1:57": "2:26.2",
                                        "1:56": "2:25.0",
                                        "1:55": "2:23.3",
                                        "1:54": "2:22.5",
                                        "1:53": "2:21.2",
                                        "1:52": "2:20.0",
                                        "1:51": "2:18.7",
                                        "1:50": "2:17.5",
                                        "1:49": "2:16.2",
                                        "1:48": "2:15.0",
                                        "1:47": "2:13.7",
                                        "1:46": "2:12.5",
                                        "1:45": "2:11.2",
                                        "1:44": "2:10.0",
                                        "1:43": "2:08.7",
                                        "1:42": "2:07.5",
                                        "1:41": "2:06.3",
                                        "1:40": "2:05.0",
                                        "1:39": "2:03.7",
                                        "1:38": "2:02.5",
                                        "1:37": "2:01.2",
                                        "1:36": "2:00.0",
                                        "1:35": "1:58.7",
                                        "1:34": "1:57.5",
                                        "1:33": "1:56.3",
                                        "1:32": "1:55.0",
                                        "1:31": "1:53.9",
                                        "1:30": "1:52.5"
    ]
    
    
    let seventy: [String:String] = ["2:10": "2:49.0",
                                    "2:09": "2:47.7",
                                    "2:08": "2:46.4",
                                    "2:07": "2:45.1",
                                    "2:06": "2:43.8",
                                    "2:05": "2:42.5",
                                    "2:04": "2:41.2",
                                    "2:03": "2:39.9",
                                    "2:02": "2:38.6",
                                    "2:01": "2:37.3",
                                    "2:00": "2:36.0",
                                    "1:59": "2:34.7",
                                    "1:58": "2:33.4",
                                    "1:57": "2:32.1",
                                    "1:56": "2:30.8",
                                    "1:55": "2:29.5",
                                    "1:54": "2:28.2",
                                    "1:53": "2:26.9",
                                    "1:52": "2:25.6",
                                    "1:51": "2:24.3",
                                    "1:50": "2:23.0",
                                    "1:49": "2:21.7",
                                    "1:48": "2:20.4",
                                    "1:47": "2:19.1",
                                    "1:46": "2:17.8",
                                    "1:45": "2:16.4",
                                    "1:44": "2:15.2",
                                    "1:43": "2:13.9",
                                    "1:42": "2:12.6",
                                    "1:41": "2:11.4",
                                    "1:40": "2:10.0",
                                    "1:39": "2:08.7",
                                    "1:38": "2:07.4",
                                    "1:37": "2:06.1",
                                    "1:36": "2:04.8",
                                    "1:35": "2:03.5",
                                    "1:34": "2:02.2",
                                    "1:33": "2:00.9",
                                    "1:32": "1:59.6",
                                    "1:31": "1:58.4",
                                    "1:30": "1:57.0"
    ]
    
    
    let sixtyfive: [String:String] = ["2:10": "2:55.5",
                                      "2:09": "2:54.1",
                                      "2:08": "2:52.8",
                                      "2:07": "2:51.4",
                                      "2:06": "2:50.1",
                                      "2:05": "2:48.7",
                                      "2:04": "2:47.4",
                                      "2:03": "2:46.0",
                                      "2:02": "2:44.7",
                                      "2:01": "2:43.3",
                                      "2:00": "2:42.0",
                                      "1:59": "2:40.6",
                                      "1:58": "2:39.3",
                                      "1:57": "2:37.9",
                                      "1:56": "2:36.6",
                                      "1:55": "2:35.2",
                                      "1:54": "2:33.9",
                                      "1:53": "2:32.5",
                                      "1:52": "2:31.2",
                                      "1:51": "2:29.8",
                                      "1:50": "2:28.5",
                                      "1:49": "2:27.1",
                                      "1:48": "2:25.8",
                                      "1:47": "2:24.4",
                                      "1:46": "2:23.1",
                                      "1:45": "2:21.7",
                                      "1:44": "2:20.4",
                                      "1:43": "2:19.0",
                                      "1:42": "2:17.7",
                                      "1:41": "2:16.4",
                                      "1:40": "2:15.0",
                                      "1:39": "2:13.6",
                                      "1:38": "2:12.3",
                                      "1:37": "2:10.9",
                                      "1:36": "2:09.6",
                                      "1:35": "2:08.2",
                                      "1:34": "2:06.9",
                                      "1:33": "2:05.5",
                                      "1:32": "2:04.2",
                                      "1:31": "2:02.9",
                                      "1:30": "2:01.5"
    ]
    
    
    let sixty: [String:String] = ["2:10": "3:02.0",
                                  "2:09": "3:00.6",
                                  "2:08": "2:59.2",
                                  "2:07": "2:57.8",
                                  "2:06": "2:56.4",
                                  "2:05": "2:55.0",
                                  "2:04": "2:53.6",
                                  "2:03": "2:52.2",
                                  "2:02": "2:50.8",
                                  "2:01": "2:49.4",
                                  "2:00": "2:48.0",
                                  "1:59": "2:46.6",
                                  "1:58": "2:45.2",
                                  "1:57": "2:43.8",
                                  "1:56": "2:42.4",
                                  "1:55": "2:41.0",
                                  "1:54": "2:39.6",
                                  "1:53": "2:38.2",
                                  "1:52": "2:36.8",
                                  "1:51": "2:35.4",
                                  "1:50": "2:34.0",
                                  "1:49": "2:32.6",
                                  "1:48": "2:31.2",
                                  "1:47": "2:29.8",
                                  "1:46": "2:28.4",
                                  "1:45": "2:26.7",
                                  "1:44": "2:25.6",
                                  "1:43": "2:24.2",
                                  "1:42": "2:22.8",
                                  "1:41": "2:21.5",
                                  "1:40": "2:20.0",
                                  "1:39": "2:18.6",
                                  "1:38": "2:17.2",
                                  "1:37": "2:15.8",
                                  "1:36": "2:14.4",
                                  "1:35": "2:13.0",
                                  "1:34": "2:11.6",
                                  "1:33": "2:10.2",
                                  "1:32": "2:08.8",
                                  "1:31": "2:07.5",
                                  "1:30": "2:06.0"
    ]
    
    
    let fiftyfive: [String:String] = ["2:10": "3:08.5",
                                      "2:09": "3:07.0",
                                      "2:08": "3:05.6",
                                      "2:07": "3:04.1",
                                      "2:06": "3:02.7",
                                      "2:05": "3:01.2",
                                      "2:04": "2:59.8",
                                      "2:03": "2:58.3",
                                      "2:02": "2:56.9",
                                      "2:01": "2:55.4",
                                      "2:00": "2:54.0",
                                      "1:59": "2:52.5",
                                      "1:58": "2:51.1",
                                      "1:57": "2:49.6",
                                      "1:56": "2:48.2",
                                      "1:55": "2:46.7",
                                      "1:54": "2:45.3",
                                      "1:53": "2:43.8",
                                      "1:52": "2:52.4",
                                      "1:51": "2:40.9",
                                      "1:50": "2:39.5",
                                      "1:49": "2:38.0",
                                      "1:48": "2:36.6",
                                      "1:47": "2:35.1",
                                      "1:46": "2:33.7",
                                      "1:45": "2:31.9",
                                      "1:44": "2:30.8",
                                      "1:43": "2:29.3",
                                      "1:42": "2:27.9",
                                      "1:41": "2:26.5",
                                      "1:40": "2:25.0",
                                      "1:39": "2:23.5",
                                      "1:38": "2:22.1",
                                      "1:37": "2:20.6",
                                      "1:36": "2:19.2",
                                      "1:35": "2:17.7",
                                      "1:34": "2:16.3",
                                      "1:33": "2:14.9",
                                      "1:32": "2:13.4",
                                      "1:31": "2:12.0",
                                      "1:30": "2:10.5"
    ]
    ////// percentages \\\\\\
    
    // full guide for look-up
    var paceGuide: [Int:[String:String]]
    
    // constructor
    init(){
        self.paceGuide = [95:ninetyfive, 90:ninety, 85:eightyfive, 80:eighty, 75:seventyfive, 70:seventy, 65:sixtyfive, 60:sixty, 55:fiftyfive]
    }
    
    // pace finder
    func pace(min: Int, max: Int, test: String) -> [(Int:String)]{
        var goals = []
        if(min==max){
            goals.add(min:paceGuide[min]![test]!)
        }
        else{
            var l = Int(min)
            let h = Int(max)
            while(l<=h){
                l paceGuide[l]![test]!)")
                l+=5
            }
        }
    }
}