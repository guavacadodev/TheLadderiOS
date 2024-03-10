//
//  inputBirthday.swift
//  TheLadder
//
//  Created by Jake Woodall on 3/13/24.
//

import SwiftUI

struct inputBirthday: View {
    @Binding var shouldPlayAnimation: Bool
    var body: some View {
        VStack {
            HStack {
                Text("When is your birthday?")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal)
                Spacer()
            }
            HStack {
                Text("Please enter your date of birth.")
                    .padding(.leading)
                    .padding(3)
                    .font(.caption)
                Spacer()
            }
            UserBirthdayContent()
            NavigationLink {
                phoneAuthView()
            } label: {
                ZStack {
                    Text("Button To Auth Method")
                        .foregroundColor(.white)
                        .padding()
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .background(.black)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
            }

            Spacer()
        }
        .padding(.top, 10)
    }
}

struct UserBirthdayContent: View {
    @State private var selectedMonth: String = "January"
    @State private var selectedDay: Int = 1
    @State private var selectedYear: Int = 2024

    var body: some View {
        VStack {
            birthdaySelectedText(selectedDay: $selectedDay, selectedMonth: $selectedMonth, selectedYear: $selectedYear)
            birthdaySelectorView(selectedDay: $selectedDay, selectedMonth: $selectedMonth, selectedYear: $selectedYear)
        }
    }
}

struct birthdaySelectedText: View {
    @Binding var selectedDay: Int
    @Binding var selectedMonth: String
    @Binding var selectedYear: Int
    
    var body: some View {
        let dateString = "\(selectedMonth) \(selectedDay) \(selectedYear)"
        VStack(alignment: .leading) {
            VStack {
                HStack {
                    Text("Birthday")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                        .padding(.vertical, 10)
                    Spacer()
                }
                ZStack {
                    Text(verbatim: dateString)
                        .font(.title)
                        .background {
                            Rectangle()
                                .frame(width: 300, height: 50)
                                .padding()
                                .foregroundStyle(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                        }
                }
            }
            .padding(.horizontal)
            Divider()
            
        }
    }
}

struct birthdaySelectorView: View {
    @Binding var selectedDay: Int
    @Binding var selectedMonth: String
    @Binding var selectedYear: Int

    let days = Array(1...31)
    let months = [
        "January", "February", "March", "April", "May", "June",
        "July", "August", "September", "October", "November", "December"
    ]
    let years = Array(1900...2024)

    var body: some View {
        HStack {
            Picker("Day", selection: $selectedDay) {
                ForEach(days, id: \.self) { day in
                    Text(verbatim: "\(day)").tag(day)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(width: UIScreen.main.bounds.width / 3, height: 150)
            .clipped()

            Picker("Month", selection: $selectedMonth) {
                ForEach(months, id: \.self) { month in
                    Text(month).tag(month)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(width: UIScreen.main.bounds.width / 3, height: 150)
            .clipped()

            Picker("Year", selection: $selectedYear) {
                ForEach(years, id: \.self) { year in
                    Text(verbatim: "\(year)").tag(year)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(width: UIScreen.main.bounds.width / 3, height: 150)
            .clipped()
        }
    }
}


