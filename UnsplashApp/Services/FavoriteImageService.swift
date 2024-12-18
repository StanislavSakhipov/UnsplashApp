//
//  FavoriteImageService.swift
//  UnsplashApp
//
//  Created by Stanislav Sakhipov on 12/17/24.
//

import Foundation
import CoreData

final class FavoriteImageService {
    
    static var shared = FavoriteImageService()
    var context = CoreDataStack.shared.context
    
    private init() {}
    
    func addFavoriteImage(imageID: String, imageURL: String){
        let favoriteImage =  FavoriteImage(context: context)
        favoriteImage.id = imageID
        favoriteImage.url = imageURL
        favoriteImage.createdAt = Date()
        
        saveContext()
    }
    
    func removeFavoriteImage(imageID: String) {
        let request: NSFetchRequest<FavoriteImage> = FavoriteImage.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", imageID)
        do {
            let results = try context.fetch(request)
            for object in results {
                context.delete(object)
            }
            saveContext()
        } catch {
            print("Ошибка удаления")
        }
    }
    
    func isFavoriteImage(imageID: String) -> Bool {
        let request: NSFetchRequest<FavoriteImage> = FavoriteImage.fetchRequest()
        request.predicate = NSPredicate(format: "id == $@", imageID)
        
        do {
            let count = try context.count(for: request)
            return count > 0
        } catch {
            print("Ошибка при проверке isFavoriteImage")
            return false
        }
    }
    
    func getAllFavorites() -> [FavoriteImage] {
        let request: NSFetchRequest<FavoriteImage> = FavoriteImage.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "createdAt", ascending: false)]
        
        do {
            return try context.fetch(request)
        } catch {
            print("Ошибка при загрузке всех изображений")
            return []
        }
    }
    
    private func saveContext() {
        CoreDataStack.shared.saveContext()
    }
}
