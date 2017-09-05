//
//  ViewController.swift
//  XFDemo
//
//  Created by Harvey He on 2017/9/5.
//  Copyright © 2017年 Harvey He. All rights reserved.
//

import UIKit
class ViewController: UIViewController,IFlySpeechRecognizerDelegate,IFlySpeechSynthesizerDelegate {

  

  

    //讯飞语音识别
    var iFlySpeechRecognizer:IFlySpeechRecognizer!
    //语音合成
    var iFlySpeechSynthesizer:IFlySpeechSynthesizer!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(frame:CGRect(x:100,y:100,width:100,height:40));
        button.backgroundColor = .red;
        button.addTarget(self, action:#selector(click), for: UIControlEvents.touchUpInside);
        self.view.addSubview(button);
        
        IFlySpeechUtility.createUtility("appid=59a90381")
        initRecognizer()
        initSynthesizer()
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    
    func click(){
        
        startOrStop();
        
    }
    
    func startOrStop(){
        iFlySpeechSynthesizer.stopSpeaking()
        iFlySpeechRecognizer.startListening()
       
    }
    
    
    
    //MARK: - IFlySpeechSynthesizerDelegate
    func initSynthesizer(){
        
        iFlySpeechSynthesizer = IFlySpeechSynthesizer.sharedInstance()
        iFlySpeechSynthesizer.delegate = self
        
        iFlySpeechSynthesizer.setParameter(IFlySpeechConstant.type_CLOUD(), forKey: IFlySpeechConstant.engine_TYPE())
        iFlySpeechSynthesizer.setParameter("50", forKey: IFlySpeechConstant.speed())
        iFlySpeechSynthesizer.setParameter("50", forKey: IFlySpeechConstant.volume())
        iFlySpeechSynthesizer.setParameter("vinn", forKey: IFlySpeechConstant.voice_NAME())
        iFlySpeechSynthesizer.setParameter("8000", forKey: IFlySpeechConstant.sample_RATE())
        iFlySpeechSynthesizer.setParameter("30000", forKey: IFlySpeechConstant.net_TIMEOUT())
        iFlySpeechSynthesizer.setParameter("tts.pcm", forKey: IFlySpeechConstant.tts_AUDIO_PATH())
        
    }
    
    //MARK: - IFlySpeechRecognizerDelegate
    //初始化语音识别器
    func initRecognizer(){
        
        iFlySpeechRecognizer = IFlySpeechRecognizer.init()
        iFlySpeechRecognizer.setParameter("", forKey: IFlySpeechConstant.params())
        iFlySpeechRecognizer.setParameter("iat", forKey: IFlySpeechConstant.ifly_DOMAIN())
        iFlySpeechRecognizer.setParameter("100000", forKey: IFlySpeechConstant.speech_TIMEOUT())
        iFlySpeechRecognizer.setParameter("1800", forKey: IFlySpeechConstant.vad_EOS())
        iFlySpeechRecognizer.setParameter("1800", forKey: IFlySpeechConstant.vad_BOS())
        iFlySpeechRecognizer.setParameter("20000", forKey: IFlySpeechConstant.net_TIMEOUT())
        iFlySpeechRecognizer.setParameter("16000", forKey: IFlySpeechConstant.sample_RATE())
        iFlySpeechRecognizer.setParameter("zh_cn", forKey: IFlySpeechConstant.language())
        iFlySpeechRecognizer.setParameter("mandarin", forKey: IFlySpeechConstant.accent())
        iFlySpeechRecognizer.setParameter("1", forKey: IFlySpeechConstant.asr_PTT())
        iFlySpeechRecognizer.setParameter("plain", forKey: IFlySpeechConstant.result_TYPE())
        iFlySpeechRecognizer.delegate = self
    }
    
    func onError(_ errorCode: IFlySpeechError!) {
        print(errorCode.errorDesc);
    }


    func onBeginOfSpeech() {
        print("开始");
    }
    
    func onEndOfSpeech() {
        print("结束");
    }
    
    func onCompleted(_ error: IFlySpeechError!) {
        
        print(error.errorDesc);
    }
    
    func onResults(_ results: [Any]!, isLast: Bool) {
        
        let resultString: NSMutableString = ""
        if results != nil {
            let dict = results[0] as! NSDictionary
            for (key,_) in dict {
                resultString.append("\(key)")
            }
            
            var resultStr:String! = resultString as String
            resultStr = resultStr.replacingOccurrences(of: "。", with: "")
            resultStr = resultStr.replacingOccurrences(of: "？", with: "")
            resultStr = resultStr.replacingOccurrences(of: "！", with: "")
            print(resultStr)
            iFlySpeechRecognizer.cancel()
            
    }

    }
    


}

