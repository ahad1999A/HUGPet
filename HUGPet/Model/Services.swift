//
//  Services.swift
//  ServicesTest
//
//  Created by Ahad Obaid Albaqami on 16/11/1443 AH.
//

import Foundation



struct Services : Identifiable{
    let id: UUID = UUID()
    var service: ServicesCategory
    var kindOfService: KindOfServiceCategory
    var KindsOfPet: [PetTypes]
    var servicesImage: String
    var name: String
    var description: String
    var BackgroundPackage : String
    var packageOne: String
    var packageTwo: String
    var packageThree: String
    var packageDescription: String
    var packagePet: String
//    var packageFour: String


    
}

 enum ServicesCategory: String, Identifiable, CaseIterable{
    
    public var id: String {
        return self.rawValue.capitalized
    }
    
    case showerService
    case groomingService
    case vacccinationService
    case surgeryService
    
    var title: String {
        switch self {
        case .showerService:
            return "استحمام"
        case .groomingService:
            return "حلاقة"
        case .vacccinationService:
            return "تطعيم"
        case .surgeryService:
            return "تعقيم"
        }
    }
    
    
    var description: String {
        switch self {
        case .showerService:
            return "يمكن أن يحافظ معطف الحيوانات الأليفة على راحة بشرته ورطوبتها خلال أكثر شهور السنة برودة وجفافًا."
        case .groomingService:
            return "تحسين نظافة الحيوانات الأليفة وتحسين مظهرها الجسدي."
        case .vacccinationService:
            return "تساعد في إعداد جهاز المناعة لدى حيوانك الأليف للدفاع عن نفسه ضد أي غزو للكائنات المسببة للأمراض."
        case .surgeryService:
            return "يمكن أن يحافظ معطف الحيوانات الأليفة على راحة بشرته ورطوبتها خلال أكثر شهور السنة برودة وجفافًا."
        }
    }
    
    
}

public enum PetTypes:  String, Identifiable, CaseIterable  {
    public var id: String {
        return self.rawValue.capitalized
    }
    
    case Dog
    case Cat
    case Rabbit
    case Bird
    
}


public enum KindOfServiceCategory: String, Identifiable, CaseIterable{
    
    public var id: String {
        return self.rawValue.capitalized
    }
    
    case WaterShower
    case DryShower
    case MedicineShower
    case Grooming1
    case Grooming2
    case Grooming3
    case Vacccination1
    case Vacccination2
    case Vacccination3
    case Surgery1
    case Surgery2
    case Surgery3
    
    var title: String {
        switch self {
        case .WaterShower:
            return "استحمام مائي"
        case .DryShower:
            return "استحمام جاف"
        case .MedicineShower:
            return "استحمام طبي"
        case .Grooming1:
            return "حلاقة 1"
        case .Grooming2:
            return "حلاقة 2"
        case .Grooming3:
            return "حلاقة 3"
        case .Vacccination1:
            return " تطعيم 1"
        case .Vacccination2:
            return " تطعيم 2"
        case .Vacccination3:
            return " تطعيم 3"
        case .Surgery1:
            return "تعقيم ١"
        case .Surgery2:
            return "تعقيم ٢"
        case .Surgery3:
            return "تعقيم ٣"
        }
    }
    
    var description: String{
        switch self {
        case .WaterShower:
            return "تنظيف عين\nتنظيف اذن\nقص اظافر\nتمشيط شعر\nعطر\nباودر"
        case .DryShower:
            return "تنظيف عين\nتنظيف اذن\nقص اظافر\nتمشيط شعر\nعطر\nباودر"
        case .MedicineShower:
            return "تنظيف عين\nتنظيف اذن\nقص اظافر\nتمشيط شعر\nعطر\nباودر"
        case .Grooming1:
            return "حلاقة١ ديكربشن"
        case .Grooming2:
            return "حلاقة٢ ديكربشن"
        case .Grooming3:
            return "حلاقة٣ ديكربشن"
        case .Vacccination1:
            return "تطعيم ديسكربشن ١"
        case .Vacccination2:
            return "تطعيم ديسكربشن  ٢"
        case .Vacccination3:
            return "تطعيم ديسكربشن ٣"
        case .Surgery1:
            return "تعقيم ديسكربشن ١"
        case .Surgery2:
            return "تعقيم ديسكربشن ٢"
        case .Surgery3:
            return "تعقيم ديسكربشن ٣"
        }
    }
    
//        var imageForAllService: UIImage{
//            switch self {
//            case .WaterShower:
//                return UIImage(named: "ShowerPackages")!
//            case .DryShower:
//                return UIImage(named: "ShowerPackages")!
//            case .MedicineShower:
//                return UIImage(named: "ShowerPackages")!
//            case .Grooming1:
//                return UIImage(named: "GroomingServices")!
//                // return UIImage("GroomingServices")!
//            case .Grooming2:
//                return UIImage(named: "GroomingServices")!
//
//            case .Grooming3:
//                return UIImage(named: "GroomingServices")!
//
//            case .Vacccination1:
//                return UIImage(named: "VaccServices")!
//            case .Vacccination2:
//                return UIImage(named: "VaccServices")!
//
//            case .Vacccination3:
//                return UIImage(named: "VaccServices")!
//
//            case .Surgery1:
//                return UIImage(named: "VaccServices")!
//
//            case .Surgery2:
//                return UIImage(named: "VaccServices")!
//
//            case .Surgery3:
//                return UIImage(named: "VaccServices")!
//
//            }
//        }
}
