//
//  Constans.swift
//  AffirmApp
//
//  Created by Julia on 18/12/2023.
//

import Foundation
import SwiftUI

struct Constans {
    static var gradient: LinearGradient {
        return LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.orange, Color.yellow]), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    static let fileURLWithPath = "/dev/null"
    
    //Images
    static let background = "background"
    static let onboarding1 = "onboarding1"
    static let onboarding2 = "onboarding2"
    static let onboarding3 = "onboarding3"
    static let onboarding4 = "onboarding4"
    static let closeIcon = "xmark"
    
    //TabContentViewIcons
    static let houseIcon = "house.fill"
    static let heartIcon = "heart.fill"
    
    //HomeViewIcons
    static let plusIcon = "plus"
    static let gearIcon = "gearshape"
    
    //AffirmationOfTheDayViewIcons
    static let arrowIcon = "arrow.counterclockwise"
    static let starFilledIcon = "star.fill"
    static let starEmptyIcon = "star"
    
    //WelcomeView
    static let firstWelcomeHeader = "Witaj Przyjacielu!"
    static let secondWelcomeHeader = "Jak sie nazywasz?"
    static let username = "username"
    static let askingForNotificationInfo = "Powiadomienia możesz poźniej wyłaczyć w ustawieniach aplikacji"
    static let goToSettingsText = "Możesz zezwolić aplikacji AffirmApp na powiadomienia w ustawieniach"
    
    static let shouldShowWelcome = "shouldShowWelcome"
    static let shouldShowNotification = "shouldShowNotification"
    static let shouldShowOnboarding = "shouldShowOnboarding"
    
    static let successCoreDataMessage = "Successfully loaded core data!"
    
    //Affirmations
    static let affirmationPageTitle = "Lista afirmacji"
    static let affirmationModeOff = "Koniec"
    static let affirmationModeOn = "Zaczynam"
    
    static let affirmationsContainer = "AffirmationsContainer"
    static let affirmationEntity = "AffirmationEntity"
    static let lastDisplayDate = "lastDisplayDate"
    static let favourites = "Favourites"
    static let counter = "Counter"

    static let alertProgressTitle = "Przyjacielu!"
    static let notificationAlertDescription = "Pamiętaj o codzinnych afirmacjach"
    static let confirmButton = "OK"
    
    //AddAffirmation
    static let addAffirmationTitle = "Dodaj afirmację"
    static let affirmationInputFieldHint = "Wpisz afirmację"
    
    //EditAffirmation
    static let editAffirmationTitle = "Edytuj afirmację"
    static let saveButton = "Zapisz"
    static let testAffirmationText = "Test affirmation"
    
    //SettingsTexts
    static let appImage = "appImage"
    static let appDescription = "Aplikacja do zarządzania afirmacjami, w której będziesz mógł śledzić swój postęp \n w budowaniu nawyku pozytywnego myślenia."
    static let appName = "AffirmApp"
    static let notificationToggleText = "Czy chcesz dostawać przypomnienia o codziennej afirmacji?"
    static let notificationTitle = "Powiadomienia"
    static let onboaringButton = "Zobacz samouczek"
    static let onboardingTitle = "Samouczek"
    
    //SettingsIcons
    static let infoIcon = "info.circle"
    static let notificationIcon = "bell.badge.circle"
    static let onboardingIcon = "book.circle"
    
    //Tab
    static let start = "Start"
    static let affirmationTabName = "Afirmacje"
    
    //HomeView
    static let affirmationOfTheDayCardTitle = "Afirmacja dnia: "
    static let progressChartCardTitle = "Twój postęp: "
    static let emptyProgressChartDescription = "W tym miejscu będzie rejestrowany postęp tworzenia nawyku."
    
    static let affirmations: [Affirmation] = [
            Affirmation(id: 1, description: "Jestem silny i zdolny."),
            Affirmation(id: 2, description: "Działam celowo i sensownie."),
            Affirmation(id: 3, description: "Jestem wdzięczny za wszystko, co mam."),
            Affirmation(id: 4, description: "Promieniuję życzliwością."),
            Affirmation(id: 5, description: "Mam w sobie moc do zmiany."),
            Affirmation(id: 6, description: "Doceniam swoje unikalne talenty."),
            Affirmation(id: 7, description: "Jestem otwarty na nowe możliwości."),
            Affirmation(id: 8, description: "Wierzę w swoje zdolności."),
            Affirmation(id: 9, description: "Działam sprawnie i dynamicznie."),
            Affirmation(id: 10, description: "W pełni akceptuję siebie."),
            Affirmation(id: 11, description: "Moje życie to dar."),
            Affirmation(id: 12, description: "Jestem otwarty na nowe doświadczenia."),
            Affirmation(id: 13, description: "Otacza mnie piękno."),
            Affirmation(id: 14, description: "Mam doskonałą intuicję."),
            Affirmation(id: 15, description: "Moje myśli są pozytywne i pełne nadziei."),
            Affirmation(id: 16, description: "Jestem magnesem na pozytywne doświadczenia."),
            Affirmation(id: 17, description: "Bogactwo jest dla mnie naturalne."),
            Affirmation(id: 18, description: "Uczę się i rozwijam każdego dnia."),
            Affirmation(id: 19, description: "Moje serce jest otwarte na miłość."),
            Affirmation(id: 20, description: "Każdy dzień przynosi nowe możliwości."),
            Affirmation(id: 21, description: "Jestem wdzięczny za moją rodzinę i przyjaciół."),
            Affirmation(id: 22, description: "Moje marzenia stają się rzeczywistością."),
            Affirmation(id: 23, description: "Czuję się kochany i kocham."),
            Affirmation(id: 24, description: "Przyciągam dobro i miłość."),
            Affirmation(id: 25, description: "Mam wiele darów i zasobów, którymi mogę dzielić się ze światem."),
            Affirmation(id: 26, description: "Jestem otwarty na obfitość i błogosławieństwa, które do mnie płyną."),
            Affirmation(id: 27, description: "Moja przyszłość jest dobra i jasna."),
            Affirmation(id: 28, description: "Mam pełne zaufanie, że wszechświat mi sprzyja."),
            Affirmation(id: 29, description: "Mam mnóstwo wolnego czasu."),
            Affirmation(id: 30, description: "Świetnie sobie radzę w każdej sytuacji."),
            Affirmation(id: 31, description: "Mój świat jest pełen miłości."),
            Affirmation(id: 32, description: "Żyję w harmonii i w zgodzie ze sobą."),
            Affirmation(id: 33, description: "Jestem pełen doskonałych pomysłów."),
            Affirmation(id: 34, description: "Przyjmuję coraz więcej pieniędzy z lekkością i radością."),
            Affirmation(id: 35, description: "Jestem hojnie wynagradzana za swoją pracę."),
            Affirmation(id: 36, description: "W relacjach z ludźmi wybieram miłość, szczerość i otwartość."),
            Affirmation(id: 37, description: "Otwieram się na bezwarunkową miłość w relacji z partnerem."),
            Affirmation(id: 38, description: "Doceniam i wykorzystuję swoją kreatywność i pomysłowość."),
            Affirmation(id: 39, description: "Mieszkam w idealnym dla mnie miejscu."),
            Affirmation(id: 40, description: "Wiem, czego chcę."),
            Affirmation(id: 41, description: "Kocham siebie."),
            Affirmation(id: 42, description: "Ufam sobie."),
            Affirmation(id: 43, description: "Wierzę w siebie."),
            Affirmation(id: 44, description: "Jestem wolny."),
            Affirmation(id: 45, description: "Jestem szczęśliwy."),
            Affirmation(id: 46, description: "Jestem silny."),
            Affirmation(id: 47, description: "Otaczają mnie cudowni ludzie."),
            Affirmation(id: 48, description: "Jestem pełny."),
            Affirmation(id: 49, description: "Jestem kompletny."),
            Affirmation(id: 50, description: "Jestem wartościowy."),
            Affirmation(id: 51, description: "Jestem odważny."),
            Affirmation(id: 52, description: "Jestem mądry."),
            Affirmation(id: 53, description: "Jestem inteligentny."),
            Affirmation(id: 54, description: "Jestem gotowy."),
            Affirmation(id: 55, description: "Jestem uczciwy."),
            Affirmation(id: 56, description: "Cieszę się moim życiem."),
            Affirmation(id: 57, description: "Doceniam piękno, które istnieje wokół mnie."),
            Affirmation(id: 57, description: "Dbam o siebie."),
            Affirmation(id: 58, description: "Opiekuję się sobą."),
            Affirmation(id: 59, description: "Koncentruję się na tym, co mogę."),
            Affirmation(id: 60, description: "Mam prawo do bycia sobą."),
            Affirmation(id: 61, description: "Moje decyzje zawsze są trafne."),
            Affirmation(id: 62, description: "Mam dużą wiedzę i potrafię ją wykorzystać."),
            Affirmation(id: 63, description: "Jestem wyjątkowy i niepowtarzalny."),
            Affirmation(id: 64, description: "Jestem ważny."),
            Affirmation(id: 65, description: "Jestem wspaniały."),
            Affirmation(id: 66, description: "Jestem potrzebny."),
            Affirmation(id: 67, description: "Jestem spójny i skuteczny w działaniu."),
            Affirmation(id: 68, description: "Moje życie jest istotne."),
            Affirmation(id: 69, description: "Moje życie ma sens."),
            Affirmation(id: 70, description: "To, czego w danym momencie potrzebuję, samo do mnie przychodzi."),
            Affirmation(id: 71, description: "Rozwijam się."),
            Affirmation(id: 72, description: "Życie jest dla mnie przyjemnością."),
            Affirmation(id: 73, description: "Z radością i ekscytacją wybieram drogę, którą chce iść."),
            Affirmation(id: 74, description: "Codziennie realizuję wartości, które cenię."),
            Affirmation(id: 75, description: "Jestem pełen optymizmu."),
            Affirmation(id: 76, description: "Kocham i szanuję moje życie."),
            Affirmation(id: 77, description: "Oddycham wolnością."),
            Affirmation(id: 78, description: "Przyciągam nieograniczoną ilość dobra i miłości."),
            Affirmation(id: 79, description: "Cieszę się z pomocy, którą niosę innym."),
            Affirmation(id: 80, description: "Podoba mi się moja rzeczywistość."),
            Affirmation(id: 81, description: "Z odwagą robię kolejny krok."),
            Affirmation(id: 82, description: "Cenię swoją unikalność."),
            Affirmation(id: 83, description: "Moje afirmacje szybko stają się rzeczywistością."),
            Affirmation(id: 84, description: "Jestem wdzięczny za to, co mam."),
            Affirmation(id: 85, description: "Jestem zdolny do osiągania wielkich rzeczy."),
            Affirmation(id: 86, description: "Każdego dnia widzę wiele powodów do szczęścia."),
            Affirmation(id: 87, description: "Mam odwagę podążać za swoimi marzeniami."),
            Affirmation(id: 88, description: "Otacza mnie przyjaźń i wiele wsparcia."),
            Affirmation(id: 89, description: "Jestem wdzięczny za wszelkie dobra."),
            Affirmation(id: 90, description: "Wierzę w swoje nieograniczone możliwości."),
            Affirmation(id: 91, description: "Akceptuję siebie całkowicie i z miłością."),
            Affirmation(id: 92, description: "Moje myśli są pełne pozytywnej energii."),
            Affirmation(id: 93, description: "Jestem twórcą własnego szczęścia."),
            Affirmation(id: 94, description: "Moja przyszłość jest jasna i pełna nadziei."),
            Affirmation(id: 95, description: "Osiągam z łatwością."),
            Affirmation(id: 96, description: "Jestem odważny w podejmowaniu decyzji."),
            Affirmation(id: 97, description: "Stanowię wyjątkową wartość."),
            Affirmation(id: 98, description: "Nieustannie budzę w sobie radość."),
            Affirmation(id: 99, description: "Moje życie jest pełne radości i szczęścia."),
            Affirmation(id: 100, description: "Jestem spokojny i zrelaksowany.") ]
}

