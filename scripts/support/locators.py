#Home Page
magaluLogo = "css:.header-logo"
magaluLogoImage = "css:.lu-header-a"
searchInput = "id:inpHeaderSearch"
searchButton = "id:btnHeaderSearch"

magaluRightHeader = "css:.container-right-top-header"
loginBlock = magaluRightHeader + " .content-login-car"
loginLink = loginBlock + " .login-link"
quantityItems = " .quantity-itens"
favoriteBlock = loginBlock + " .container-wishlist .wish-top-header"
favoriteIcon = favoriteBlock + " .icon-fav"
favoriteCount = favoriteBlock + quantityItems
cartBlock = loginBlock + " .container-checkout  .car-top-header"
cartIcon = cartBlock + " .icon-cart"
cartCount = cartBlock + quantityItems

topLinksBlock = magaluRightHeader + " .container-links-top-header"
myOrdersLink = topLinksBlock + " [href='/acompanhamento/']"

loading = "css:svg.CenteredLoading"


commonPageElements = [magaluLogo,
                      searchInput,
                      searchButton,
                      favoriteIcon,
                      favoriteCount,
                      cartIcon,
                      cartCount
                      ]

homePageElements = [loginLink,
                    myOrdersLink,
                    magaluLogoImage]
homePageElements.extend(commonPageElements)

productBlock = "css:.nm-product-item  .productShowCaseContainer"

searchResultPageElements = [productBlock]
searchResultPageElements.extend(commonPageElements)

#PDP
productTitle = "css:.header-product__title"
productDescriptionLink = "css:[href='#anchor-description']"
productDescriptionBlock = "css:.description"
productImage = "css:img.showcase-product__big-img"
productPriceText = "css:.price-template__text"
productAddToCartButton = "css:button.button__buy-product-detail"


productElements = [productTitle,
                   productDescriptionLink,
                   productDescriptionBlock,
                   productImage,
                   productPriceText,
                   productAddToCartButton]
productElements.extend(commonPageElements)

warrantyContinueButton = "css:.price-warranty__btn--continue"

warrantyElements = [warrantyContinueButton]

#Cart
cartItem = "css:.BasketItem-productContainer"
cartItemInfo = cartItem + " *.BasketItemProduct-info"
cartItemTitle = cartItemInfo + "  .BasketItemProduct-info-title"

cartElements = [cartItem]