//
//  inputBirthday.swift
//  TheLadder
//
//  Created by Jake Woodall on 3/13/24.
//

import SwiftUI

struct inputBirthday: View {
    @Binding var shouldPlayAnimation: Bool
    @StateObject var viewModel: AuthViewModel
    @State private var navigateToPhoneAuth = false // Flag to control navigation
    var signInType: SignInType = .phone

    func destinationView(for signInType: SignInType) -> AnyView {
        switch signInType {
        case .email:
            return AnyView(emailAuthView())
        case .phone:
            return AnyView(phoneAuthView())
        case .google:
            return AnyView(loginAccountGoogleView())
        case .facebook:
            return AnyView(loginAccountFacebookView())
        case .twitter:
            return AnyView(loginAccountXView())
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("When is your birthday?")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                Spacer()
            }
            .font(.title)
            .fontWeight(.bold)
            
            HStack {
                Text("Please enter your date of birth.")
                    .padding(.leading)
                    .padding(3)
                    .font(.caption)
                Spacer()
            }
            
            UserBirthdayContent()
            
            Button(action: {
                // Validate the form
                viewModel.validateForm()
                
                // Set the navigation flag to true if the form is valid
                if viewModel.isFormValid {
                    navigateToPhoneAuth = true
                }
            }) {
                ZStack {
                    Text("Button To Auth Method")
                        .foregroundColor(.white)
                        .padding()
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .background(viewModel.isFormValid ? .black : .gray)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
            }

            Spacer()
        }
        .padding(.top, 10)
        .onChange(of: viewModel.isFormValid) { _ in
            shouldPlayAnimation = viewModel.isFormValid // Update shouldPlayAnimation based on form validity
        }
        // Use NavigationLink with the separate boolean flag
        .background(
            NavigationLink(destination: destinationView(for: signInType), isActive: $navigateToPhoneAuth) {
                EmptyView()
            }
            .hidden()
        )
    }
}

struct UserBirthdayContent: View {
    @State private var selectedMonth: String = "March"
    @State private var selectedDay: Int = 3
    @State private var selectedYear: Int = 2023
    
    var body: some View {
        VStack {
            birthdaySelectedText(selectedDay: $selectedDay, selectedMonth: $selectedMonth, selectedYear: $selectedYear, viewModel: AuthViewModel())
            birthdaySelectorView(selectedDay: $selectedDay, selectedMonth: $selectedMonth, selectedYear: $selectedYear)
        }
    }
}

struct birthdaySelectedText: View {
    @Binding var selectedDay: Int
    @Binding var selectedMonth: String
    @Binding var selectedYear: Int
    @StateObject var viewModel: AuthViewModel
    
    var body: some View {
        let dateString = "\(selectedMonth) \(selectedDay), \(selectedYear)"
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
        .onChange(of: dateString) { newDateString in
            // Update viewModel.dateOfBirth whenever dateString changes
            viewModel.dateOfBirth = newDateString           
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


