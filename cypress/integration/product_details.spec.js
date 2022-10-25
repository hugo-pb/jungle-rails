describe("Navigation", () => {
  it("should visit root", () => {
    cy.visit("/");
  });
  it("visits product details", () => {
    cy.get("span").contains("Giant Tea").click();
    cy.get("div .quantity").contains("stock");
  });
});
