import SwiftUI
import Charts

enum Country {
    case USA
    case Korea
}

struct Interestrate: Identifiable {
    let month: String
    let interestRate: Double
    
    var id: String { month }
}

var usaInterestrate: [Interestrate] = [
    .init(month: "Jan", interestRate: 0.25),
    .init(month: "Feb", interestRate: 0.25),
    .init(month: "Mar", interestRate: 0.5),
    .init(month: "Apr", interestRate: 0.5),
    .init(month: "May", interestRate: 1.0),
    .init(month: "Jun", interestRate: 1.75),
    .init(month: "Jul", interestRate: 2.5),
    .init(month: "Aug", interestRate: 2.5),
    .init(month: "Sep", interestRate: 3.25),
    .init(month: "Oct", interestRate: 3.25),
    .init(month: "Nov", interestRate: 4.0),
    .init(month: "Dec", interestRate: 4.5)]

var koreaInterestrate: [Interestrate] = [
    .init(month: "Jan", interestRate: 1.25),
    .init(month: "Feb", interestRate: 1.25),
    .init(month: "Mar", interestRate: 1.25),
    .init(month: "Apr", interestRate: 1.5),
    .init(month: "May", interestRate: 1.75),
    .init(month: "Jun", interestRate: 1.75),
    .init(month: "Jul", interestRate: 2.25),
    .init(month: "Aug", interestRate: 2.5),
    .init(month: "Sep", interestRate: 2.5),
    .init(month: "Oct", interestRate: 3.0),
    .init(month: "Nov", interestRate: 3.25),
    .init(month: "Dec", interestRate: 3.25)]

struct ContentView: View {
    @State var country: Country = .USA

    var data: [Interestrate] {
        switch country {
        case .USA:
            return usaInterestrate
        case .Korea:
            return koreaInterestrate
        }        
    }

    var body: some View {
        VStack {
            Picker("Country", selection: $country.animation(.easeInOut)) {
                Text("USA").tag(Country.USA)
                Text("Korea").tag(Country.Korea)
            }
            .pickerStyle(.segmented)
            .padding()
            
            Chart(data) { country in
                LineMark(
                    x: .value("Month", country.month),
                    y: .value("Interestrate", country.interestRate))
                .interpolationMethod(.monotone)
                
            }
            .foregroundStyle(.black)
            .chartYAxis {
                AxisMarks(position: .leading)
            }


        }

        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
