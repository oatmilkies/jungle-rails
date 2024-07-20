describe('Product Details', () => {
  it('should navivigate from the homepage to a product detail page', () => {
    cy.visit('/'); 
    // products should be visible
    cy.get(".products article").should("be.visible");
    // click on a product
    cy.get('article').contains("Giant Tea").click();
    // navigate to selected product
    cy.url().should("include", "/products/1");
  });
});
