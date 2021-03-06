//
//  MessageCategoryVC.swift
//  MessagesExtension
//
//  Created by Yudiz Solutions Pvt. Ltd. on 28/01/17.
//  Copyright © 2017 Yudiz Solution Pvt Ltd. All rights reserved.
//

import UIKit
import Messages
import SafariServices

class MessageCategoryVC: MSMessagesAppViewController, UITableViewDelegate, UITableViewDataSource, SFSafariViewControllerDelegate {
    
    @IBOutlet weak var tblView: UITableView!
    var savedConversation: MSConversation?
    var safariVC : SFSafariViewController? = nil
    var allYudizData : [YudizData]! = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Conversation Handling
    override func willBecomeActive(with conversation: MSConversation) {
        savedConversation = conversation
        // Called when the extension is about to move from the inactive to active state.
        // This will happen when the extension is about to present UI.
        // Use this method to configure the extension and restore previously stored state.
    }
    
    override func didResignActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the active to inactive state.
        // This will happen when the user dissmises the extension, changes to a different
        // conversation or quits Messages.
        // Use this method to release shared resources, save user data, invalidate timers,
        // and store enough state information to restore your extension to its current state
        // in case it is terminated later.
    }
   
    override func didReceive(_ message: MSMessage, conversation: MSConversation) {
        // Called when a message arrives that was generated by another instance of this
        // extension on a remote device.
        // Use this method to trigger UI updates in response to the message.
    }
    
    override func didStartSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user taps the send button.
    }
    
    override func didCancelSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user deletes the message without sending it.
        // Use this to clean up state related to the deleted message.
    }
    
    override func willTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        guard presentationStyle == .expanded else { return }
        if let message = activeConversation?.selectedMessage, let url = message.url {
            safariVC = SFSafariViewController(url: url)
            present(safariVC!, animated: true, completion: nil)
        }
        // Called before the extension transitions to a new presentation style.
        // Use this method to prepare for the change in presentation style.
    }
    
    override func didTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called after the extension transitions to a new presentation style.
        // Use this method to finalize any behaviors associated with the change in presentation style.
    }
    
    //MARK: - Other Methods
    func prepareData(){
        let dataHandler = DataHandler()
        allYudizData = dataHandler.prepareData()
    }
    
    //MARK: - Table View Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return allYudizData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = allYudizData[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let message = MSMessage()
        let layout = MSMessageTemplateLayout()
        layout.caption = "Yudiz Soulution Pvt Ltd"
        layout.subcaption = allYudizData[indexPath.row].title
        message.url = allYudizData[indexPath.row].webUrl
        message.layout = layout
        savedConversation?.insert(message, completionHandler: nil)
    }
}

