describe('Product Details', () => {
  it('should navivigate from the homepage to a product detail page', () => {
    cy.visit('/'); 
    cy.get(".products article").should("be.visible");
    cy.get('article').contains("Giant Tea").click();
    cy.url().should("include", "/products/1");
  });
});
