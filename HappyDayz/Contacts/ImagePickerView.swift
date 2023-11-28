//
//  ImagePickerView.swift
//  HappyDayz
//
//  Created by Anson Joseph on 2023-11-24.
//

import SwiftUI
import AVKit
import SwiftUI
import Photos

struct ImagePickerView: View {
    @Binding var selectedImage: UIImage?
    @State private var isImagePickerPresented = false
    @State private var sourceType: UIImagePickerController.SourceType?
    @State private var isCameraAuthorized = false
    @State private var isLibraryAuthorized = false

    var body: some View {
        VStack {
            Text("Choose an option:")
                .font(.headline)
                .padding()

            Button("Open Camera") {
                sourceType = .camera
                checkCameraPermission()
            }
            .padding()

            Button("Open Library") {
                sourceType = .photoLibrary
                checkLibraryPermission()
            }
            .padding()
            .sheet(isPresented: $isImagePickerPresented) {
                if let sourceType = sourceType {
                    ImagePicker(sourceType: sourceType, selectedImage: $selectedImage)
                }
            }

            Spacer()
        }
        .padding()
    }

    func checkCameraPermission() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            isImagePickerPresented.toggle()
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                isCameraAuthorized = granted
                if granted {
                    isImagePickerPresented.toggle()
                }
            }
        default:
            // Handle denied or restricted access
            break
        }
    }

    func checkLibraryPermission() {
        switch PHPhotoLibrary.authorizationStatus() {
        case .authorized:
            isImagePickerPresented.toggle()
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { status in
                isLibraryAuthorized = status == .authorized
                if status == .authorized {
                    isImagePickerPresented.toggle()
                }
            }
        default:
            // Handle denied or restricted access
            break
        }
    }
}

struct ImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView(selectedImage: .constant(UIImage(named: "")))
    }
}
