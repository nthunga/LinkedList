//
//  ViewController.swift
//  LinkedList
//
//  Created by Naveen Thunga on 11/03/16.
//  Copyright © 2016 YMedia Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let linkedList : LinkedList = LinkedList<String>()
        linkedList.addLink("10")
        linkedList.addLink("20")
        linkedList.addLink("30")
        linkedList.addLink("40")

        linkedList.printAllKeys()
        linkedList.removeLinkAtIndex(2)
        print("\n\n\n")
        linkedList.printAllKeys()
    }
}

class Node<T:Equatable>{
    var value : T?
    var next : Node?
    var prev : Node?
}


public class LinkedList<T: Equatable>
{ //create new LLNode instance
    private var head = Node<T>()
    
    func addLink(value: T)
    { //establish head node
        if (head.value == nil)
        {
            head.value = value
            return
        }
        //establish iteration variables
        var current: Node? = head
        
        while (current != nil) {
            if current?.next == nil {
                let childToUse: Node = Node<T>()
                childToUse.value = value
                childToUse.prev = current
                current!.next = childToUse
                break
            }
            else
            {
                current = current?.next
            }
        } //end while
    }
    
    func removeLinkAtIndex(index : Int){
        
        var current : Node<T>? = head
        var trailer : Node<T>?
        var listIndex : Int = 0
        
        if index == 0{
            current = current?.next
            head = current!
            return
        }
        
        while current != nil{
            if listIndex == index{
                trailer?.next = current?.next
                current = nil
                break
            }
            
            trailer = current
            current = current?.next
            listIndex++
        }
    }
    
    
    func printAllKeys() {
        var current: Node! = head
        //assign the next instance 
        while current != nil {
            print("link item is: \(current.value)")
            current = current.next
        }
    }
}

