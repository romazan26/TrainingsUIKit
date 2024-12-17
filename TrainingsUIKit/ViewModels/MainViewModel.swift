//
//  MainViewModel.swift
//  TrainingsUIKit
//
//  Created by Роман on 15.12.2024.
//

import Foundation
import CoreData
import SwiftUI

final class MainViewModel: ObservableObject {
    private var manager = CoreDataManager.instance
    
    @Published var workouts: [Workout] = []
    @Published var exercises: [Exercise] = []
    @Published var favoriteWorkouts: [Workout] = []
    
    @Published var simpleNameWorkout = ""
    @Published var simpleTimeWorkout = ""
    @Published var simpletime = Date()
    
    var cheak: String {
        let hours = Calendar.current.component(.hour, from: simpletime)
        let minutes = Calendar.current.component(.minute, from: simpletime)
        let hoursString = NSLocalizedString("hours", comment: "Часы")
        let minutesString = NSLocalizedString("minutes", comment: "Минуты")
        return "\(hours)\(hoursString) \(minutes)\(minutesString)"
    }
    
    @Published var simpleExercises: [Exercise] = []
    @Published var simpleNameExercise = ""
    @Published var simpleApproaches = ""
    @Published var isEditMod = false
    
    @Published var searchText: String = ""
    
    init(){
        let calendar = Calendar.current
        let now = Date()
        self.simpletime = calendar.date(bySettingHour: 0, minute: 0, second: 0, of: now) ?? Date()
        fetchWorkouts()
        fetchExercises()
        getFavoriteWorkouts()
    }
    
    //MARK: - Filtred workouts
    func getFavoriteWorkouts(){
        favoriteWorkouts = workouts.filter(\.isFavorite)
    }
    //MARK: - Search work func
    func isSearching(work: Workout) -> Bool {
        guard !searchText.isEmpty else {
            return true // Если строка поиска пустая, показываем все
        }
        return work.name!.uppercased().contains(searchText.uppercased())
    }
    
    //MARK: - Edit mod
    func startEditMod(workout: Workout){
        isEditMod = true
        simpleNameWorkout = workout.name ?? ""
    }
    
    func andEditMod(workout: Workout){
        isEditMod = false
        workout.name = simpleNameWorkout
        saveWorkout()
    }
    
    //MARK: - Edite data
    func editIsFavorite(workout: Workout){
        workout.isFavorite.toggle()
        saveWorkout()
        getFavoriteWorkouts()
    }
    
    //MARK: - Delete data
    func removeSimpleExercise(byName name: String) {
        if let index = simpleExercises.firstIndex(where: { $0.name == name }) {
            simpleExercises.remove(at: index)
        }
    }
    
    func deleteExercise(exercise: Exercise){
        let request = NSFetchRequest<Exercise>(entityName: "Exercise")
        do{
            exercises = try manager.context.fetch(request)
            if let exercise = exercises.first(where: { $0.name == exercise.name }){
                manager.context.delete(exercise)
                saveExercise()
            }
        }catch let error{
            print("Error fetching exercises: \(error)")
        }
    }
    
    //MARK: - Add data
    func addWorkout(){
        let workout = Workout(context: manager.context)
        workout.name = simpleNameWorkout
        workout.time = cheak
        for exercise in simpleExercises {
            addExercise(workout: workout, inexercise: exercise)
        }
        saveWorkout()
        clearWorkouts()
    }
    
    func addExercise(workout: Workout, inexercise: Exercise){
        let exercise = Exercise(context: manager.context)
        exercise.name = inexercise.name
        exercise.approaches = inexercise.approaches
        exercise.workout = workout
        saveExercise()
    }
    
    func addSimpleExercise(){
        if !simpleNameExercise.isEmpty {
            let exercise = Exercise(context: manager.context)
            exercise.name = simpleNameExercise
            exercise.approaches = simpleApproaches
            simpleExercises.append(exercise)
        }
        
    }
    
    //MARK: - Clear data
    func clearWorkouts(){
        simpleNameWorkout = ""
        simpleTimeWorkout = ""
        simpleExercises.removeAll()
        simpleNameExercise = ""
        simpleApproaches = ""
        let calendar = Calendar.current
        let now = Date()
        self.simpletime = calendar.date(bySettingHour: 0, minute: 0, second: 0, of: now) ?? Date()
    }
    
    //MARK: - Get data
    func fetchWorkouts() {
        let request = NSFetchRequest<Workout>(entityName: "Workout")
        do{
            workouts = try manager.context.fetch(request)
        }catch let error{
            print("Error fetching workouts: \(error)")
        }
    }
    
    func fetchExercises() {
        let request = NSFetchRequest<Exercise>(entityName: "Exercise")
        do{
            exercises = try manager.context.fetch(request)
        }catch let error{
            print("Error fetching exercises: \(error)")
        }
    }
    
    //MARK: - Save data
    func saveWorkout(){
        workouts.removeAll()
        manager.save()
        fetchWorkouts()
    }
    
    func saveExercise(){
        exercises.removeAll()
        manager.save()
        fetchExercises()
    }
}
