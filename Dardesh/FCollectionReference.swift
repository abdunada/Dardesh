//
//  FCollectionReference.swift
//  Dardesh
//
//  Created by Abdelrahman Nada on 24/12/2021.
//

import Foundation
import Firebase

// MARK: - enum - FCollection Reference
enum FCollectionReference: String {
    
    case User
    
}
// MARK: - Firestore Reference
func FireStoreReference(_ collectionReference: FCollectionReference)-> CollectionReference {
    
    return Firestore.firestore().collection(collectionReference.rawValue)
}
