import UIKit

public class PagingView: UIView {
  
  public let pageView: UIView
  public let collectionView: UICollectionView
  public let options: PagingOptions
  
  public init(pageView: UIView, collectionView: UICollectionView, options: PagingOptions) {
    
    self.pageView = pageView
    self.collectionView = collectionView
    self.options = options
    
    super.init(frame: .zero)
    
    configure()
  }
  
  public required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public func configure() {
    addSubview(collectionView)
    addSubview(pageView)
    setupConstraints()
  }
  
  public func setupConstraints() {
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    pageView.translatesAutoresizingMaskIntoConstraints = false
    
    let metrics = [
      "height": options.menuHeight]
    
    let views = [
      "collectionView": collectionView,
      "pageView": pageView]
    
    let horizontalCollectionViewContraints = NSLayoutConstraint.constraintsWithVisualFormat(
      "H:|[collectionView]|",
      options: .DirectionLeadingToTrailing,
      metrics: metrics,
      views: views)
    
    let horizontalPagingContentViewContraints = NSLayoutConstraint.constraintsWithVisualFormat(
      "H:|[pageView]|",
      options: .DirectionLeadingToTrailing,
      metrics: metrics,
      views: views)
    
    let verticalContraints = NSLayoutConstraint.constraintsWithVisualFormat(
      "V:|[collectionView(==height)][pageView]|",
      options: .DirectionLeadingToTrailing,
      metrics: metrics,
      views: views)
    
    addConstraints(horizontalCollectionViewContraints)
    addConstraints(horizontalPagingContentViewContraints)
    addConstraints(verticalContraints)
  }
  
}
