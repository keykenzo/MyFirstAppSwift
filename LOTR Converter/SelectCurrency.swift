//
//  SelectCurrency.swift
//  LOTR Converter
//
//  Created by Mario Duarte on 21/01/26.
//

import SwiftUI

struct SelectCurrency: View {
	@Environment(\.dismiss) var dismiss
	
	@Binding var topCurrency: Currency
	@Binding var bottomCurrency: Currency
	
	var body: some View {
		ZStack {
			// Parchment Background Image
			Image(.parchment)
				.resizable()
				.ignoresSafeArea()
				.background(.brown)
			
			VStack(spacing: 16) {
				// Texto 1
				Text("Select the currency you are starting with:")
					.fontWeight(.bold)
				
				// Ícones de moeda (origem)
				IconGrid(currency: $topCurrency)
				
				// Texto 2
				Text("Select the currency you would like to convert to:")
					.fontWeight(.bold)
					.padding(.top)
				
				IconGrid(currency: $bottomCurrency)
				
				// Botão Done
				Button("Done") {
					dismiss()
				}
				.buttonStyle(.borderedProminent)
				.tint(.brown.mix(with: .black, by: 0.2))
				.font(.largeTitle)
				.padding(.top, 8)
				.foregroundStyle(.white)
			}
			.padding()
			.multilineTextAlignment(.center)
			.foregroundStyle(.black)
		}
	}
}

#Preview {
	@Previewable @State var topCurrency: Currency = .silverPenny
	@Previewable @State var bottomCurrency: Currency = .goldPenny
	
	SelectCurrency(topCurrency: $topCurrency, bottomCurrency: $bottomCurrency)
}
