//
//  scrollViewViewController.swift
//  Realize_hackathon
//
//  Created by Guilherme Rangel on 06/10/19.
//  Copyright © 2019 Adriano Ramos. All rights reserved.
//

import UIKit

class scrollViewViewController: UIViewController, UIScrollViewDelegate {

     @IBOutlet weak var scrollView: UIScrollView!{
           didSet{
               scrollView.delegate = self
           }
       }
       
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides:[Slide] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slides = createSlides()
        setupSlideScrollView(slides: slides)
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)
      
    }
    
    
    let s = Slide()
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "LoginView" {
//            var vc = segue.destination as! LoginViewController
//            vc.
//        }
//    }
    
    func createSlides() -> [Slide] {

        let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.imgView.image = UIImage(named: "pig")
        slide1.lblTitle.textColor = .black
                   slide1.lblDescription.textColor = .black
        slide1.lblTitle.text = "Conheça a Realize"
        slide1.lblDescription.text = "Soluções financeiras personalizadas para você"
        
        let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide2.imgView.image = UIImage(named: "womanBuck")
        slide2.lblTitle.textColor = .black
                   slide2.lblDescription.textColor = .black
        slide2.lblTitle.text = "Facilidade na palma da sua mão"
        slide2.lblDescription.text = "Oferecemos controle financeiro de fácil compreensão e formas de pagamento que atendam as suas necessidades"
        
        let slide3:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
              slide3.imgView.image = UIImage(named: "calc")
            slide3.lblTitle.textColor = .black
            slide3.lblDescription.textColor = .black
              slide3.lblTitle.text = "100% Digital"
            
              slide3.lblDescription.text = "Oferecemos condições e acompanhamento exclusivos. Sem surpresas no final do mês. Sem letras miúdas."
        
        
        return [slide1, slide2, slide3]
    }
    

    func setupSlideScrollView(slides : [Slide]) {
            scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
            scrollView.isPagingEnabled = true
            
            for i in 0 ..< slides.count {
                slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
                scrollView.addSubview(slides[i])
            }
        }
        
        
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {

        setupSlideScrollView(slides: slides)
    }
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
            pageControl.currentPage = Int(pageIndex)
            
            let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
            let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x
            
            // vertical
            let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
            let currentVerticalOffset: CGFloat = scrollView.contentOffset.y
            
            let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maximumHorizontalOffset
            let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset
            
            
    
            let percentOffset: CGPoint = CGPoint(x: percentageHorizontalOffset, y: percentageVerticalOffset)
            
//            if(percentOffset.x > 0 && percentOffset.x <= 0.33) {
//
//                slides[0].imgView.transform = CGAffineTransform(scaleX: (0.33-percentOffset.x)/0.33, y: (0.33-percentOffset.x)/0.33)
//                slides[1].imgView.transform = CGAffineTransform(scaleX: percentOffset.x/0.33, y: percentOffset.x/0.33)
//
//            } else if(percentOffset.x > 0.33 && percentOffset.x <= 0.66) {
//                slides[1].imgView.transform = CGAffineTransform(scaleX: (0.50-percentOffset.x)/0.25, y: (0.50-percentOffset.x)/0.25)
//                slides[2].imgView.transform = CGAffineTransform(scaleX: percentOffset.x/0.50, y: percentOffset.x/0.50)
//
//            } else if(percentOffset.x > 0.50 && percentOffset.x <= 0.75) {
//                slides[2].imgView.transform = CGAffineTransform(scaleX: (0.75-percentOffset.x)/0.25, y: (0.75-percentOffset.x)/0.25)
//
//
//        }
        
        
        
        
        func scrollView(_ scrollView: UIScrollView, didScrollToPercentageOffset percentageHorizontalOffset: CGFloat) {
            if(pageControl.currentPage == 0) {
                let pageUnselectedColor: UIColor = fade(fromRed: 255/255, fromGreen: 255/255, fromBlue: 255/255, fromAlpha: 1, toRed: 103/255, toGreen: 58/255, toBlue: 183/255, toAlpha: 1, withPercentage: percentageHorizontalOffset * 3)
                pageControl.pageIndicatorTintColor = pageUnselectedColor
            
                
                let bgColor: UIColor = fade(fromRed: 103/255, fromGreen: 58/255, fromBlue: 183/255, fromAlpha: 1, toRed: 255/255, toGreen: 255/255, toBlue: 255/255, toAlpha: 1, withPercentage: percentageHorizontalOffset * 3)
                slides[pageControl.currentPage].backgroundColor = bgColor
                
                let pageSelectedColor: UIColor = fade(fromRed: 81/255, fromGreen: 36/255, fromBlue: 152/255, fromAlpha: 1, toRed: 103/255, toGreen: 58/255, toBlue: 183/255, toAlpha: 1, withPercentage: percentageHorizontalOffset * 3)
                pageControl.currentPageIndicatorTintColor = pageSelectedColor
            }
        }
        
        
        func fade(fromRed: CGFloat,
                  fromGreen: CGFloat,
                  fromBlue: CGFloat,
                  fromAlpha: CGFloat,
                  toRed: CGFloat,
                  toGreen: CGFloat,
                  toBlue: CGFloat,
                  toAlpha: CGFloat,
                  withPercentage percentage: CGFloat) -> UIColor {
            
            let red: CGFloat = (toRed - fromRed) * percentage + fromRed
            let green: CGFloat = (toGreen - fromGreen) * percentage + fromGreen
            let blue: CGFloat = (toBlue - fromBlue) * percentage + fromBlue
            let alpha: CGFloat = (toAlpha - fromAlpha) * percentage + fromAlpha
            
            // return the fade colour
            return UIColor(red: red, green: green, blue: blue, alpha: alpha)
        }
}
}
