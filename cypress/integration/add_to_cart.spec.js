describe("Navigation", () => {
  it("should visit root", () => {
    cy.visit("/");
  });
  it("it should click to cart and change cart number from 0 to 1", () => {
    cy.get('a[href*="/cart"]').contains("0");
    cy.get("button").contains("Add").click({ force: true });
    cy.get('a[href*="/cart"]').contains("1");
  });
});
